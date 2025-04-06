function [Score] = FastFitnessFunctionVariableSegmentSnakeRobotPARAM(design,sample_size,Voxels,directory, testsetup)
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
qrxL = q_home(1) - testsetup.RavenLimits_xrot ; %radians was 0
qrxU = q_home(1) + testsetup.RavenLimits_xrot ; %was pi/4
%y rotation 
qryL = q_home(2) - testsetup.RavenLimits_yrot ;
qryU = q_home(2) + testsetup.RavenLimits_yrot ;
%z translation;%
qrzL = testsetup.RavenLimits_tranmin; 
qrzU = testsetup.RavenLimits_tranmax;

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
    %Append segment configurations to whole configuration space:
    Q(:,(4+(ii-1)*2):(5+(ii-1)*2)) = [qip, qit];
    % pan = 4+(k-1)*2  :seg =1 4+0, 5+0
    %tilt = 5+(k-1)*2   :seg = 2 4+2 = 6, 5+2 = 7
end


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
unique_hits_when = zeros(N,1);
no_hits = false;
tends = [];
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

    tends = [tends, tend];

    %if tend voxel is in bounds (not 0 indices) and labelled goal 
    if (~(any(v==0)) && (V.Goal_labels(v(1),v(2),v(3)) == true))
        
        
        %Find trajectory, endeffector rotation
        [Traj,Rend,~] = ForwardKinematicsVariableSegmentTraj(EntranceFrame,tooltransform,design,q,dV,traj_length);

        %Check if Trajectory is collision free as well
        if (CheckCollision(V,Traj) == false)
          disp(['ii = ', num2str(ii)])
          %Get patch in the new map
          new_map = servicesphere_mapping(Rend,V,v);
          
          % plot_my_plot_traj(Traj, design.alpha, design.n, design.d, EntranceFrame)
          SuccessfulConfig = [SuccessfulConfig; q];

          % Keep track of successes as samples increase
          temp = ss_map|new_map;
          if (sum(ss_map(:)) == sum(temp(:))) %% CAN ONLY BE USED IN REGULAR FOR LOOP !!! 
              repeats = repeats + 1;
              unique_hits_when(ii,1) = 0;   
          else
              unique_hits_when(ii,1) = 1;
          end

          %Update sphere maps with OR operation its parfor loop friendly
          ss_map = ss_map|new_map; 

        end
    end
end 

% plot_my_plot_tend(tends, design.alpha, design.n, design.d, EntranceFrame)

%% if no hits
 if isempty(SuccessfulConfig)
    no_hits = true;
 end

%% Hits
total_unique_hits = sum(unique_hits_when);
disp(['Unique: ', num2str(total_unique_hits)])

% Check 
if (total_unique_hits + repeats == length(SuccessfulConfig))
    disp('Correct!')
else
    disp('Hits incorrect.')
end

%% Extract alpha sets - Size of sample spaces per alpha value

disp('Alpha Sample Sizes (per degree interval)')
Total_configs_per_angle = [];
n = design.n;

for a = 1:1:90
    theta_max = deg2rad(a*n/2); %%rad2deg((deg2rad(90)*n/2))

    valid_configs = all(Q(:,4:5) <=theta_max, 2);
    config_subset = Q(valid_configs, :);

    sizesub = size(config_subset, 1);
    % disp(sizesub);
    Total_configs_per_angle = [Total_configs_per_angle; a, theta_max, sizesub];
end

diffs = abs( Total_configs_per_angle(:,3) - [Total_configs_per_angle(2:end,3);N]);


%% Alpha hits
Total_hits_per_angle = []; % TOTAL UNIQUE HITS PER ANGLE
if no_hits == true
    disp('There were no successes.')
    Total_hits_per_angle = zeros(90,1);
    alphahitdiffs = zeros(90,1);
else
    for a = 1:1:90

        theta_max = a*n/2;
        arU = deg2rad(theta_max);

        config_subset = [];

        valid_configs = all(SuccessfulConfig(:,4:5) <= arU, 2);
        config_subset = SuccessfulConfig(valid_configs, :);


        Total_hits_per_angle = [Total_hits_per_angle; a, rad2deg(arU), size(config_subset, 1) ];
    end
    alphahitdiffs = abs(Total_hits_per_angle(:,3) - [Total_hits_per_angle(2:end, 3); 0]);

end

%% Final output
info_final = [Total_hits_per_angle, alphahitdiffs, Total_configs_per_angle(:, 3), diffs];

%% Figures
identifier = [V.filename, ' N: ', num2str(N), ' ', test_setup.descript]; 

figure('name', 'Alpha vs Hits')
u = 90;
hold on
plot(info_final(1:u,1), info_final(1:u,3))
xlabel('alpha')
ylabel('Hits')
title('Alpha vs Hits')
subtitle(identifier)
hold off

figure('name', 'Alpha vs No. Configurations')
hold on
yyaxis right
plot(info_final(:,1), info_final(:,5))
xlabel('alpha')
ylabel('Configurations (Samples)')

yyaxis left
plot(info_final(:,1), info_final(:,6))
xlabel('alpha')
ylabel('Difference')

subtitle(identifier)
hold off



% % % % % 
% % % % % AngleHit = [Q(:,4:5), unique_hits_when(:, 1) ]; % records which angles are hitting
% % % % % save(['N', num2str(N), 'AngleHit'], AngleHit) % will need to recalculate dexterity, can only compare same size sample sizes within samples?, try all permutations?  
% % % % % 
% % % % % % plot_my_plot_tend(tends, design.alpha, design.n, design.d, EntranceFrame)
% % % % % 
% % % % % disp(['success: ', num2str(length(SuccessfulConfig))])
% % % % % % disp(['Unique success: ', num2str(length(SuccessfulConfig) - repeats)])
% % % % % % uniques = length(unique(SuccessfulConfig,'rows'))
% % % % % 
% % % % % % Dexterity: Total unique hits / (Ntheta * Nh * No.goal voxels)
% % % % % % disp('hits list:')
% % % % % [x, y, z] = ind2sub(size(ss_map), find(ss_map));
% % % % % % disp([x, y, z])
% % % % % disp(['hits total: ', num2str(length(x))])
% % % % % uniques = unique([x, y, z],'rows');
% % % % % disp(['Unique hits: ', num2str(length(uniques))])

%% Dexterity over time
sample_hit_when_cumulative = zeros(N,1);
running = 0;
for k = 1:N
    running = running + unique_hits_when(k,1);
    sample_hit_when_cumulative(k,1) = running ;
end


% %% Get the plots
% 
% figure(8888)
% hold on; ytickformat('%.0f'); 
% ax = gca;
% ax.YAxis.Exponent = 0;  
% plot(1:1:N, sample_hit_when_cumulative, 'k-')
% hold off
% 
% dexterity_oversamples = sample_hit_when_cumulative / (V.ServiceSphere_params(1)* V.ServiceSphere_params(2)*V.ServiceSphere_params(1)*V.NumberGoalVoxels );
% figure(9999)
% hold on; ytickformat('%.4f');
% ax = gca;
% ax.YAxis.Exponent = 0; 
% plot(1:1:N, dexterity_oversamples, 'k-')
% hold off
% 
% 
% reachable = strcat(directory,'/figure', 'ReachableN', num2str(N), '.fig');
% savefig(8888, reachable )
% figname1 = strcat(directory,'/figure', 'Dexterity over Samples', num2str(N), '.fig');
% savefig(9999, figname1 )


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

end

