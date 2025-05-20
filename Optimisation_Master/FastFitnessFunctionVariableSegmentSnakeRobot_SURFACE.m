function [Score] = FastFitnessFunctionVariableSegmentSnakeRobot_SURFACE(design,sample_size,Voxels,directory)
% The fitness is based on the voxelisation of the anatomy and completing a
% dexterity calculation for that. That voxelisation needs to be done in
% GenerateVoxelisation.m first to export the structure of voxel data for
% this.
%author: Andrew Razjigaev 2020

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Joint space limits for design object:%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Define the number of segments in this design

segments = length(design.alpha); % ONE segment for single module design
disp(design)
disp(design.alpha)
disp(segments)

%Home Vector:
q_home = [deg2rad(-39.5967) deg2rad(-77.9160)]; % right home position
%q_home = [deg2rad(39.5967) deg2rad(-102.084)]; % left home position

%Raven Joints: Lower Upper
%x rotation
qrxL = q_home(1);% - pi/4; %radians was 0
qrxU = q_home(1);% + pi/4; %was pi/4
%y rotation;%
qryL = q_home(2);% - pi/4;
qryU = q_home(2);% + pi/4;
%z translation;%
qrzL = 30; %0;% 
qrzU = ceil(sqrt(50^2+4^2))+1;  % limit this such that the raven alone could reach the target directly 4mmx4mm target

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compute Configuration space:%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Joint Space Sampling
N = sample_size;

%Raven Joint space:
qrx = random('unif',qrxL,qrxU,N,1); %N by 1 vector
qry = random('unif',qryL,qryU,N,1);
qrz = random('unif',qrzL,qrzU,N,1);

%Configuration space calculation where Q(i,:) is the ith configuration in
%Q space
Q = zeros(N,3+segments*2);
SuccessfulConfig = []; 
Q(:,1:3) = [qrx, qry, qrz];

%Append Configurations for each Segment Joints:
for ii = 1:segments
    %Continuum Joints: Lower Upper
    theta_max = (design.alpha(ii)*design.n(ii))/2; %Maximum bending
    %pan
    qipL = -theta_max; qipU = theta_max;
    %tilt
    qitL = -theta_max; qitU = theta_max;
    %Sample configuration space, pan and tilt joints:
    qip = random('unif',qipL,qipU,N,1);
    qit = random('unif',qitL,qitU,N,1);
% %%
%     % SAMPLING ALL ALPHA COMBOS
%     n = 300
%     alpha_space = linspace(0.1,90, n);
%     qip = []; qit = [];
%     for a = 1:n
%         for b = 1:n
%             qip = [qip; alpha_space(a)];
%             qit = [qit; alpha_space(b)];
%         end
%     end
% 
%     size([qip, qit])
%%
    %Append segment configurations to whole configuration space:
    Q(:,(4+(ii-1)*2):(5+(ii-1)*2)) = [qip, qit];
    % pan = 4+(k-1)*2  :seg =1 4+0, 5+0
    %tilt = 5+(k-1)*2   :seg = 2 4+2 = 6, 5+2 = 7
end


%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load the Voxel Data about Task Space %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
V = Voxels.Voxel_data;

%Extract data 
EntranceFrame = V.VoxelBaseFrame;
Ng = V.NumberGoalVoxels;
SSparams = V.ServiceSphere_params;
dV = V.voxelsize;

%Tool Endeffector transfrom to tip
tooltransform = txyz(0,0,3); % 3 mm straight tool on the endeffector

%Determine the Trajectory sampling value based on voxel size and this design:
[traj_length,~] = OptimalTrajLength(EntranceFrame,design,tooltransform,dV);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Now Complete Dexterity Analysis:%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Reduction variable for parallel loop
ss_map = V.sphere_maps;
repeats = 0;
% sample_hit_when = zeros(N,1);
SuccessfulConfigs = zeros(N, size(Q, 2));
% tends = [];
%%disp('Q:')
%%disp(Q)

for ii = 1:N %(ii = 1:N,0) %% N PARFOR
    %for each configuration q in sampled configuration space Q
    q = Q(ii,:);  
    
    %Find Forward kinemtatic endeffector position relative to Entrance
    tend = FastForwardKinematicsSnake(tooltransform, design, q);
    % tends = [tends, tend];
    %Locate voxel indices
    v = Points2Voxels(V,tend') ;

    %if tend voxel is in bounds (not 0 indices) and labelled goal 
    if (~(any(v==0)) && (V.Goal_labels(v(1),v(2),v(3)) == true))
        disp(q)
        
        %Find trajectory, endeffector rotation
        [Traj,Rend,~] = ForwardKinematicsVariableSegmentTraj(EntranceFrame,tooltransform,design,q,dV,traj_length);

        %Check if Trajectory is collision free as well
        if (CheckCollision_surface(V,Traj)== false)
          %Get patch in the new map
          new_map = servicesphere_mapping(Rend,V,v);
          
          % plot_my_plot_traj(Traj, design.alpha, design.n, design.d, EntranceFrame)
          SuccessfulConfigs(ii, :) = q; % can just get rid of duplicates?

          %Update sphere maps with OR operation its parfor loop friendly
          ss_map = ss_map|new_map; 
        else
            disp(Traj)

        end
    end
end

%% CHECK IF ALL VOXELS HAVE BEEN HIT / HOW MANY HITS PER VOXEL
ss_map = V.sphere_maps

%%

% plot_my_plot_tend(tends, design.alpha, design.n, design.d, EntranceFrame)

disp(['success: ', num2str(length(SuccessfulConfig))])
% disp(['Unique success: ', num2str(length(SuccessfulConfig) - repeats)])
% uniques = length(unique(SuccessfulConfig,'rows'))

% Dexterity: Total unique hits / (Ntheta * Nh * No.goal voxels)
% disp('hits list:')
[x, y, z] = ind2sub(size(ss_map), find(ss_map));
% disp([x, y, z])
disp(['hits total: ', num2str(length(x))])
uniques = unique([x, y, z],'rows');
disp(['Unique hits: ', num2str(length(uniques))])

%% Dexterity over time
% sample_hit_when_cumulative = zeros(N,1);
% running = 0;
% for k = 1:N
%     running = running + sample_hit_when(k,1);
%     sample_hit_when_cumulative(k,1) = running ;
% end

% figure('Name', 'Reachable')
% plot(1:1:N, sample_hit_when_cumulative, 'k-')
% 
% dexterity_oversamples = sample_hit_when_cumulative / (V.ServiceSphere_params(1)* V.ServiceSphere_params(2)*V.ServiceSphere_params(1)*V.NumberGoalVoxels );
% figure('Name', 'Dexterity over Samples')
% plot(1:1:N, dexterity_oversamples, 'k-')

%%
% % Plot hits %
% figure('Name', 'Service Sphere Map')
% hold on
% plot3(x,y,z, 'b.', 'LineWidth',0.5)
% grid on 
% grid minor
% xlim([0, 1674])
% ylim([0, 648])
% zlim([0, 72])
% hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculate total dexterity for the goal%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Average Dexterity = sum(No)/(Ng*Ntheta*Nh);
%Get coordinates in on sphere surface from ss_params
Ntheta = SSparams(1); Nh = SSparams(2); 
%Total dexterity for Design
Total_dexterity = sum(ss_map(:))/(Ng*Ntheta*Nh);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculate Maximum dexterity and distribution %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Determining the dexterity distribution
NoI = subarray_sums(ss_map,[Ntheta,Nh,1]);
dext_dist = NoI./(Ntheta*Nh);

%Maximum Dexterity value and index:
[Max_Dexterity,index] = max(dext_dist(:));
[a,b,c] = ind2sub(size(dext_dist),index);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sum the objectives to get the result %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ouput Total score:
Score = Total_dexterity;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Save Results as a .mat file for this design %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Results = struct('Design_params',design,...
    'mean_dexterity',Total_dexterity,...
    'max_dexterity',Max_Dexterity,...
    'max_location',[a,b,c],...
    'dexterity_distribution',dext_dist,...
    'service_sphere_maps',ss_map);
%Save the Results based on the design parameters
result_file = strcat('Design_alpha',...
    strrep(strrep(strrep(strrep(num2str(design.alpha),'.',''),'        ','_'),'___','_'),'__','_'),...
    '_n',strrep(strrep(num2str(design.n),'.',''),'  ','_'),...
    '_d',strrep(strrep(strrep(strrep(num2str(design.d),'.',''),'        ','_'),'___','_'),'__','_'));

%Just in case something went wrong that is the file already exists 
%while it already exists keep changing the name until its unique
original_result_file = result_file;
duplicate_number = 0;
while exist(strcat(directory,'/',result_file,'.mat'),'file')
    disp('Duplicate Design Name... renaming')
    %This file exists rename it
    duplicate_number = duplicate_number + 1;
    result_file = strcat(original_result_file,'_duplicate_',num2str(duplicate_number));
end

% % figname1 = strcat(directory,'/figure', num2str(getfignum1()), '.fig');
% % savefig(getfignum1(), figname1 )
% figname2 = strcat(directory,'/figure', num2str(getfignum2()), '.fig');
% savefig(getfignum2(), figname2 )
% % close(getfignum1())
% close(getfignum2())

%Ideal way save
%Save in the directory folder
%save(strcat(directory,'/',result_file),'-struct','Results');

%Practical way
%Save in the directory folder
%If failure retry save until it works
not_worked = true;
while not_worked
    try
        %Ideal way save
        save(strcat(directory,'/',result_file),'-struct','Results');
        not_worked = false;
    catch
        disp('Save failed retrying...')
        not_worked = true;
        pause(1) %waits for connection error to resolve
    end
end

save([directory, '/', 'N', num2str(N), 'SuccessConfigs'], 'SuccessfulConfigs'); 


end


% Q = [-0.6911, -1.3599, 34.1659,  0.8549, -0.0965;
%      -0.6911, -1.3599, 34.1504,  0.8441, -0.1049;
%      -0.6911, -1.3599, 34.1094,  0.8520, -0.1268;
%      -0.6911, -1.3599, 34.1464,  0.8080, -0.2735;
%      -0.6911, -1.3599, 34.1118,  0.8044, -0.2986;
%      -0.6911, -1.3599, 34.1950,  0.8529, -0.1024;
%      -0.6911, -1.3599, 34.0129,  0.8270, -0.1777;
%      -0.6911, -1.3599, 34.1123,  0.7712, -0.3396;
%      -0.6911, -1.3599, 34.1309,  0.8495, -0.1414;
%      -0.6911, -1.3599, 34.2145,  0.8608, -0.1032;
%      -0.6911, -1.3599, 34.1363,  0.7977, -0.2908;
%      -0.6911, -1.3599, 34.0910,  0.8596, -0.1256;
%      -0.6911, -1.3599, 34.2267,  0.8591, -0.1076;
%      -0.6911, -1.3599, 34.1624,  0.8557, -0.1090;
%      -0.6911, -1.3599, 34.0973,  0.7986, -0.3198;
%      -0.6911, -1.3599, 34.0232,  0.7686, -0.3059;
%      -0.6911, -1.3599, 34.1093,  0.7712, -0.3400;
%      -0.6911, -1.3599, 34.0440,  0.8214, -0.2114;
%      -0.6911, -1.3599, 34.1017,  0.8520, -0.0940;
%      -0.6911, -1.3599, 34.0922,  0.7961, -0.2590;
%      -0.6911, -1.3599, 34.1022,  0.7763, -0.3177;
%      -0.6911, -1.3599, 34.0523,  0.8201, -0.1608;
%      -0.6911, -1.3599, 34.0674,  0.8214, -0.2429;
%      -0.6911, -1.3599, 34.0945,  0.8172, -0.2258;
%      -0.6911, -1.3599, 34.0702,  0.8305, -0.1544;
%      -0.6911, -1.3599, 34.2874,  0.8664, -0.1039;
%      -0.6911, -1.3599, 34.0878,  0.7910, -0.2827;
%      -0.6911, -1.3599, 34.0117,  0.8239, -0.1304;
%      -0.6911, -1.3599, 34.0841,  0.7884, -0.3239;
%      -0.6911, -1.3599, 34.0101,  0.7632, -0.3407;
%      -0.6911, -1.3599, 34.1409,  0.8407, -0.1263;
%      -0.6911, -1.3599, 34.2410,  0.8585, -0.1269;
%      -0.6911, -1.3599, 34.1102,  0.8488, -0.1547;
%      -0.6911, -1.3599, 34.0301,  0.7955, -0.3219;
%      -0.6911, -1.3599, 34.1774,  0.8181, -0.2374;
%      -0.6911, -1.3599, 34.2120,  0.8549, -0.1075;
%      -0.6911, -1.3599, 34.0340,  0.8291, -0.2160;
%      -0.6911, -1.3599, 34.2131,  0.7980, -0.3030;
%      -0.6911, -1.3599, 34.1450,  0.8555, -0.1092;
%      -0.6911, -1.3599, 34.1830,  0.8631, -0.1124;
%      -0.6911, -1.3599, 34.1283,  0.8332, -0.1969;
%      -0.6911, -1.3599, 34.0356,  0.8613, -0.0989;
%      -0.6911, -1.3599, 34.1192,  0.8463, -0.1167;
%      -0.6911, -1.3599, 34.0220,  0.8034, -0.2949;
%      -0.6911, -1.3599, 34.0347,  0.8196, -0.2110;
%      -0.6911, -1.3599, 34.0575,  0.8269, -0.2048;
%      -0.6911, -1.3599, 34.0804,  0.7926, -0.3088;
%      -0.6911, -1.3599, 34.1932,  0.8467, -0.1336;
%      -0.6911, -1.3599, 34.0617,  0.8566, -0.1373;
%      -0.6911, -1.3599, 34.0817,  0.8330, -0.1712;
%      -0.6911, -1.3599, 34.0587,  0.7701, -0.3440;
%      -0.6911, -1.3599, 34.1675,  0.8149, -0.2637;
%      -0.6911, -1.3599, 34.1834,  0.7765, -0.3553;
%      -0.6911, -1.3599, 34.0424,  0.8371, -0.1795;
%      -0.6911, -1.3599, 34.1098,  0.8126, -0.2376;
%      -0.6911, -1.3599, 34.0997,  0.8463, -0.0987;
%      -0.6911, -1.3599, 34.0993,  0.7929, -0.3257;
%      -0.6911, -1.3599, 34.1428,  0.7833, -0.3462;
%      -0.6911, -1.3599, 34.0756,  0.8048, -0.2343;
%      -0.6911, -1.3599, 34.0543,  0.7944, -0.3302;
%      -0.6911, -1.3599, 34.0722,  0.8574, -0.1152;
%      -0.6911, -1.3599, 34.0611,  0.7674, -0.3553;
%      -0.6911, -1.3599, 34.1013,  0.7744, -0.3193;
%      -0.6911, -1.3599, 34.0341,  0.7629, -0.3228;
%      -0.6911, -1.3599, 34.0630,  0.8604, -0.1212;
%      -0.6911, -1.3599, 34.3003,  0.8658, -0.1121;
%      -0.6911, -1.3599, 34.0500,  0.7704, -0.3109;
%      -0.6911, -1.3599, 34.0458,  0.7891, -0.3363;
%      -0.6911, -1.3599, 34.0192,  0.8231, -0.1625;
%      -0.6911, -1.3599, 34.1212,  0.7848, -0.3269;
%      -0.6911, -1.3599, 34.0815,  0.8348, -0.1431;
%      -0.6911, -1.3599, 34.1374,  0.8358, -0.1825;
%      -0.6911, -1.3599, 34.0939,  0.8633, -0.1033;
%      -0.6911, -1.3599, 34.0328,  0.7660, -0.3449;
%      -0.6911, -1.3599, 34.0295,  0.8314, -0.1926;
%      -0.6911, -1.3599, 34.0812,  0.7893, -0.2906;
%      -0.6911, -1.3599, 34.1268,  0.8030, -0.2941;
%      -0.6911, -1.3599, 34.1775,  0.8353, -0.1854;
%      -0.6911, -1.3599, 34.1497,  0.8248, -0.2171;
%      -0.6911, -1.3599, 34.0649,  0.7958, -0.3048;
%      -0.6911, -1.3599, 34.2174,  0.8658, -0.1077;
%      -0.6911, -1.3599, 34.0969,  0.8062, -0.2607;
%      -0.6911, -1.3599, 34.1265,  0.7917, -0.3292;
%      -0.6911, -1.3599, 34.0911,  0.7795, -0.3384;
%      -0.6911, -1.3599, 34.2078,  0.8529, -0.1433;
%      -0.6911, -1.3599, 34.0959,  0.8369, -0.1481;
%      -0.6911, -1.3599, 34.1532,  0.7816, -0.3176;
%      -0.6911, -1.3599, 34.1461,  0.7865, -0.3068];
% 
