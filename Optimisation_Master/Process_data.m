clc
clear all
% close all

%% Where to save

addpath(pwd);
%Create a directory name based on the current time
directory = strcat('Process_Results',strrep(strrep(datestr(datetime),':','_'),' ','_'));

%Create new directory ensure it doesn't already exist
[~, msg, ~] = mkdir(directory);
pause(5)

%Add path to directory
addpath(directory);

diary( strcat( directory, '/', 'diary', strrep(datestr(datetime),':','_')) )

%% Load Data

anatomies = {};

% RVF_data_SS = {'N30000000SuccessConfigsRVF_SS.mat', 'DesignRVF_alpha15708_n3_d3.mat', 'VoxelData_CylE_22mm_27Mar2025', 'Q'}; % Case RVF : Raven is allowed full movement
% RVT_data_SS = {'N30000000SuccessConfigsRVT_SS.mat', 'DesignRVT_alpha15708_n3_d3.mat', 'VoxelData_CylE_22mm_27Mar2025', 'Q'}; % Case RVF : Raven is allowed full movement

RVT_data = {'N10000000SuccessConfigs_RVT.mat', 'Design_alpha15708_n3_d3_RVT.mat', 'VoxelData_CylE_22mm_27Mar2025', 'N10000000TotalConfigs_RVT.mat'}; % Case RVF : Raven is allowed full movement

RVF_data = {'N30000000SuccessConfigs_RVF0304.mat', 'Design_alpha15708_n3_d3_RVF0304.mat', 'VoxelData_CylE_22mm_27Mar2025',  'N30000000TotalConfigs_RVF0304.mat'};

ESRVF_data = {'N40000000SuccessConfigs_ES0304.mat', 'Design_alpha15708_n3_d3_ES0304.mat', 'VoxelData_CylES_22mm_03Apr2025',  'N40000000TotalConfigs_ES0304.mat'};


select = RVT_data;
disp(['Case: ', select{2}])

sc_data = load(select{1});
sc_data = sc_data.SuccessfulConfigs;

design_data = load(select{2});
design = design_data.Design_params;
disp(design_data)

tconfigs_data = load(select{4});
configs = tconfigs_data.Q;

Anatomyfilename = select{3};

N = size(sc_data, 1);

%% Set up

Voxels = load(Anatomyfilename,'Voxel_data');
V = Voxels.Voxel_data;

EntranceFrame = V.VoxelBaseFrame;
Ng = V.NumberGoalVoxels;
SSparams = V.ServiceSphere_params;
dV = V.voxelsize;

ss_map = V.sphere_maps;
repeats = 0;
unique_hits_when = zeros(N,1);

%Tool Endeffector transfrom to tip
tooltransform = txyz(0,0,5); % 5 mm straight tool on the endeffector

%Determine the Trajectory sampling value based on voxel size and this design:
[traj_length,~] = OptimalTrajLength(EntranceFrame,design,tooltransform,dV);

%% Find Actual Successes

[~, ~, success_a] = find(sc_data(:, 1)); [~, ~, success_b] = find(sc_data(:, 2));
[~, ~, success_c] = find(sc_data(:, 3)); [~, ~, success_d] = find(sc_data(:, 4));
[~, ~, success_e] = find(sc_data(:, 5));

success = [success_a, success_b, success_c, success_d, success_e];
disp(['Success total: ', num2str(length(success))])

%% Main
for ii = 1:length(success)

    q = success(ii,:);
    tend = FastForwardKinematicsSnake(tooltransform, design, q);
    v = Points2Voxels(V,tend') ;

    % if tend voxel is in bounds (not 0 indices) and labelled goal
    if (~(any(v==0)) && (V.Goal_labels(v(1),v(2),v(3)) == true))

        % Find trajectory, endeffector rotation
        [Traj,Rend,~] = ForwardKinematicsVariableSegmentTraj(EntranceFrame,tooltransform,design,q,dV,traj_length);

        % Check if Trajectory is collision free as well
        if (CheckCollision(V,Traj) == false)
            % Get patch in the new map
            new_map = servicesphere_mapping(Rend,V,v);

            temp = ss_map|new_map;
            if (sum(ss_map(:)) == sum(temp(:))) %% CAN ONLY BE USED IN REGULAR FOR LOOP !!!
                % also comment out line 133
                repeats = repeats + 1;
                unique_hits_when(ii,1) = 0;

            else
                unique_hits_when(ii,1) = 1;
            end

            % Update sphere maps with OR operation its parfor loop friendly
            ss_map = ss_map|new_map;

        end
    end
end

%% Hits
total_unique_hits = sum(unique_hits_when);
disp(['Unique: ', num2str(total_unique_hits)])

% Check 
if (total_unique_hits + repeats == length(success))
    disp('Correct!')
else
    disp('Hits incorrect.')
end

%% Dexterity Calculation
vtot = V.TotalNumberofVoxels; disp(['Total voxels: ', num2str(vtot)])
Tartot = V.NumberGoalVoxels; disp(['Total Goal voxels: ', num2str(Tartot)])
Ntheta = V.ServiceSphere_params(1); 
Nh = V.ServiceSphere_params(2); disp(['Ntheta: ', num2str(Ntheta), '  Nh: ', num2str(Nh)])

Overall_dexterity = total_unique_hits / (Tartot*Ntheta*Nh);
disp(['Overall_dexterity: ', num2str(Overall_dexterity)])

% check 
if (Overall_dexterity == design_data.mean_dexterity)  %%WHAT IS MAXX DEXTERITY THEN????
    disp('Correct!')
else
    disp('Dexterity calculation is incorrect.')
end

%% Extract alpha sets

disp('Alpha Sample Sizes (per degree interval)')
Total_configs_per_angle = [];
% spacing = 1;
n = design.n;

for a = 1:1:90
    theta_max = deg2rad(a*n/2); %%rad2deg((deg2rad(90)*n/2))

    valid_configs = all(configs(:,4:5) <=theta_max, 2);
    config_subset = configs(valid_configs, :);

    sizesub = size(config_subset, 1);
    % disp(sizesub);
    Total_configs_per_angle = [Total_configs_per_angle; a, theta_max, sizesub];
end
%%
disp(['Total configurations for each angle in sample space', newline, '[alpha, theta_max, U, configs]'])
disp(num2str(Total_configs_per_angle))


% consider fairness of this method

diffs = abs([Total_configs_per_angle(:,3), [Total_configs_per_angle(2:end,3);0], Total_configs_per_angle(:,3) - [Total_configs_per_angle(2:end,3);N]]);

% % % % % figure
% % % % % plot(Total_configs_per_angle(:,1), Total_configs_per_angle(:, 3))
% % % % % xlabel('alpha')
% % % % % ylabel('no. of configurations tested')
% % % % % 
% % % % % figure
% % % % % plot(Total_configs_per_angle(1:end-1,1), diffs(1:end-1, 3))
% % % % % 
% % % % % xlabel('alpha')
% % % % % ylabel('diff in sample sizze between angles')

%%
% theta_max = rad2deg((deg2rad(90)*3/2))
% 
%  valid_configs = all(configs(:,4:5) <= deg2rad(135), 2);
%  config_subset = configs(valid_configs, :);
%  sizesub = size(config_subset, 1)
%  sizeset = size(configs, 1)
% 
%  diff = sizeset - sizesub

%% Alpha hits
Total_hits_per_angle = [];

for a = 1:1:90

    theta_max = a*n/2; 
    arU = deg2rad(theta_max);

    config_subset = [];

    % for ii = 1:length(success)
    %     alpha1 = abs(success(ii, 4));
    %     alpha2 = abs(success(ii, 5));
    % 
    %     if alpha1 <= arU && alpha2 <= arU
    %         config_subset = [config_subset; success(ii, :)];
    %     end
    % end
    valid_configs = all(success(:,4:5) <=arU, 2);
    config_subset = success(valid_configs, :);


    Total_hits_per_angle = [Total_hits_per_angle; a, rad2deg(arU), size(config_subset, 1) ];
end

hitdiffs = abs(Total_hits_per_angle(:,3) - [Total_hits_per_angle(2:end, 3); 0]);
hits_info = [Total_hits_per_angle, hitdiffs];
% 
% disp(['Total hits between upper and lower angles', newline, '[L, U, hits]'])
% disp(num2str(hits_info))

% sum(Total_hits_per_angle) %% should == length(success)


%% Subset size, range and angle hits

%[size upperlimit, hits]

info_final = [hits_info,  Total_configs_per_angle(:, 3), diffs(:,3)];
disp(num2str(info_final))

%%
figure('name', 'alpha vs hits total')
u =90;
hold on
plot(info_final(1:u,1), info_final(1:u,3))
xlabel('alpha')
ylabel('Hits')
hold off

figure('name', 'alpha vs samples')
hold on
yyaxis right
plot(info_final(:,1), info_final(:,5))
xlabel('alpha')
ylabel('samples')

yyaxis left
plot(info_final(:,1), info_final(:,6))
xlabel('alpha')
ylabel('diffs')

% Recall uniform distribution is used to get all the reuslws

hold off