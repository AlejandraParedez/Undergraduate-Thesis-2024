function [Score] = FastFitnessFunctionVariableSegmentSnakeRobot(design,sample_size,Voxels,directory)
% The fitness is based on the voxelisation of the anatomy and completing a
% dexterity calculation for that. That voxelisation needs to be done in
% GenerateVoxelisation.m first to export the structure of voxel data for
% this.
%author: Andrew Razjigaev 2020

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Joint space limits for design object:%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Define the number of segments in this design
segments = length(design.alpha);

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
    theta_max = (design.alpha(ii)*design.n(ii))/2; %Maximum bending <_________________REVERSE THIS FOR LARGE ANGLE CASE
    %pan
    qipL = -theta_max; qipU = theta_max;
    %tilt
    qitL = -theta_max; qitU = theta_max;
    %Sample configuration space, pan and tilt joints:
    qip = random('unif',qipL,qipU,N,1);
    qit = random('unif',qitL,qitU,N,1);
% %%
%     % SAMPLING ALL ALPHA COMBOS
%     n = 300;
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
tooltransform = txyz(0,0,5); % 5 mm straight tool on the endeffector

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

parfor ii = 1:N %(ii = 1:N,0) %% N PARFOR
    %for each configuration q in sampled configuration space Q
    q = Q(ii,:);  
    
    %Find Forward kinemtatic endeffector position relative to Entrance
    tend = FastForwardKinematicsSnake(tooltransform, design, q);
    % tends = [tends, tend];
    %Locate voxel indices
    v = Points2Voxels(V,tend') ;

    %if tend voxel is in bounds (not 0 indices) and labelled goal 
    if (~(any(v==0)) && (V.Goal_labels(v(1),v(2),v(3)) == true))
        
        
        %Find trajectory, endeffector rotation
        [Traj,Rend,~] = ForwardKinematicsVariableSegmentTraj(EntranceFrame,tooltransform,design,q,dV,traj_length);

        %Check if Trajectory is collision free as well
        if (CheckCollision(V,Traj) == false)
          %Get patch in the new map
          new_map = servicesphere_mapping(Rend,V,v);
          
          % plot_my_plot_traj(Traj, design.alpha, design.n, design.d, EntranceFrame)
          SuccessfulConfigs(ii, :) = q; % can just get rid of duplicates?


          %Update sphere maps with OR operation its parfor loop friendly
          ss_map = ss_map|new_map; 

        end
    end
end

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

