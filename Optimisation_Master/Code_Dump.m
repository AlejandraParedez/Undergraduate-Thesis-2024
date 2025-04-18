%% CODE DUMP


% % anatomies = {'VoxelData_CylE_22mm_27Mar2025'};

% anatomies = {'VoxelData_Cyl_6mm_23Mar2025.mat';
%              'VoxelData_Cyl_9mm_23Mar2025.mat';
%              'VoxelData_Cyl_12mm_23Mar2025.mat';
%              'VoxelData_Cyl_15mm_23Mar2025.mat';
%              'VoxelData_Cyl_18mm_23Mar2025.mat';
%              'VoxelData_Cyl_21mm_23Mar2025.mat';
%              'VoxelData_Cyl_24mm_23Mar2025.mat';
%              'VoxelData_Cyl_27mm_23Mar2025.mat';
%              'VoxelData_Cyl_30mm_23Mar2025.mat'};

% anatomies = {'VoxelData_Cyl_30mm_23Mar2025.mat'};

% anatomies = {'VoxelData_LBox_6mm_23Mar2025.mat';
%              'VoxelData_LBox_8mm_23Mar2025.mat';
%              'VoxelData_LBox_10mm_23Mar2025.mat';
%              'VoxelData_LBox_12mm_23Mar2025.mat';
%              'VoxelData_LBox_14mm_23Mar2025.mat';
%              'VoxelData_LBox_16mm_23Mar2025.mat';
%              'VoxelData_LBox_18mm_23Mar2025.mat';
%              'VoxelData_LBox_20mm_23Mar2025.mat';
%              'VoxelData_LBox_22mm_23Mar2025.mat';
%              'VoxelData_LBox_24mm_23Mar2025.mat';
%              'VoxelData_LBox_26mm_23Mar2025.mat'};
% 'VoxelData_LBox_28mm_23Mar2025.mat';
% 'VoxelData_LBox_30mm_23Mar2025.mat'};



%% TEST CASE 1 %%
% % Change the following to suit test case:
% 
% RV = 'T'; % Translational Movement Only
% target = 'DE'; % Direct Extruded T == TARGET
% environment = 'Cyl'; % Cylinder
% 
% samplesize = '1e3_w3d3n3'; % INCLUDES PARAM INFO TOO (00 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
% TestCase1.N = 1000;
% TestCase1.alpha = deg2rad(90);
% TestCase1.w = 3;
% TestCase1.d = 3;
% TestCase1.n = 3;
% 
% TestCase1.RavenLimits_yrot = 0; 
% TestCase1.RavenLimits_xrot = 0; 
% TestCase1.RavenLimits_tranmin = 0 ;
% TestCase1.RavenLimits_tranmax = ceil(sqrt(50^2+2^2))+1; %dist_limit = 50; %radius_limit = 4; % changes depending on cylinder used % travelallowance = 1;
% TestCase1.changingvar = 'alpha'; % Doesn't matter yet (Needs to be updated for next test phase)
% 
% TestCase1.anatomies = {'VoxelData_Cyl_12mm_23Mar2025.mat';
%                        'VoxelData_Cyl_15mm_23Mar2025.mat';
%                        'VoxelData_Cyl_24mm_23Mar2025.mat'};
% 
% % IDs and Description Strings (Don't touch this)
% TestCase1.ID = [environment,'_', 'N', samplesize, '_RV_', RV, 'T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
% TestCase1.descript = ['RV: ', RV, '   Target: ', target];

%% TEST CASE 2 %%
% RV = 'TR';
% target = 'D';
% environment = 'Cyl';
% samplesize = '50e5_w3d3n00';
% 
% TestCase2.changingvector = 1:1:10;
% 
% TestCase2.alpha = deg2rad(90);
% TestCase2.w = 3;
% TestCase2.d = 3;
% TestCase2.n = TestCase2.changingvector;
% 
% 
% TestCase2.N = 30*1e6;
% TestCase2.RavenLimits_yrot = pi/4;
% TestCase2.RavenLimits_xrot = pi/4;
% TestCase2.RavenLimits_tranmin = 30 ;
% TestCase2.RavenLimits_tranmax = 60; %dist_limit = 50; %radius_limit = 4; % changes depending on cylinder used % travelallowance = 1;
% TestCase2.changingvar = 'n';
% 
% TestCase2.anatomies = {'VoxelData_Cyl_12mm_23Mar2025.mat';
%     'VoxelData_Cyl_15mm_23Mar2025.mat';
%     'VoxelData_Cyl_24mm_23Mar2025.mat'};
% 
% % IDs and Description Strings (Don't touch this)
% TestCase2.environment = environment;
% TestCase2.ID = [environment,'_', 'N', samplesize, '_RV_', RV, 'T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
% TestCase2.descript = ['RV: ', RV, '   Target: ', target];
% 

%% TEST CASE A %%
% 
% % Change the following to suit test case:
% 
% RV = 'T'; % Translational Movement Only
% target = 'SE10'; % Direct Extruded T == TARGET
% environment = 'SB'; % Cylinder
% 
% samplesize = '10e6_w3d3n3'; % INCLUDES PARAM INFO TOO (00 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
% TestCase_A.N = 10*1e2;
% 
% TestCase_A.alpha = deg2rad(90);
% TestCase_A.w = 3;
% TestCase_A.d = 3;
% TestCase_A.n = 3;
% 
% TestCase_A.RavenLimits_yrot = 0; 
% TestCase_A.RavenLimits_xrot = 0; 
% TestCase_A.RavenLimits_tranmin = 0 ;
% TestCase_A.RavenLimits_tranmax = 50; 
% TestCase_A.changingvar = 'alpha'; % Doesn't matter yet (Needs to be updated for next test phase)
% 
% TestCase_A.anatomies = {'VoxelData_SBSE10_14mm_08Apr2025.mat';
%                        'VoxelData_SBSE10_18mm_08Apr2025.mat';
%                        'VoxelData_SBSE10_22mm_08Apr2025.mat';
%                        'VoxelData_SBSE10_26mm_08Apr2025.mat'};
% 
% % IDs and Description Strings (Don't touch this)
% TestCase_A.ID = [environment,'_', 'N', samplesize, '_RV_', RV, 'T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
% TestCase_A.descript = ['RV: ', RV, '   Target: ', target];

%% TEST CASE A %%
% 
% % Change the following to suit test case:
% 
% RV = 'TR'; % Translational & Rotational
% target = 'SE10'; % Direct Extruded T == TARGET
% environment = 'SBSE10'; % Cylinder
% 
% samplesize = '40e6_w3d00n3'; % INCLUDES PARAM INFO TOO (00 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
% TestCase_B.N = 40*1e6;
% 
% TestCase_B.changingvector = 1:1:10;
% 
% TestCase_B.alpha = deg2rad(90);
% TestCase_B.w = 3;
% TestCase_B.d = TestCaseB.changingvector;
% TestCase_B.n = 3;
% 
% TestCase_B.RavenLimits_yrot = pi/4;
% TestCase_B.RavenLimits_xrot = pi/4;
% TestCase_B.RavenLimits_tranmin = 0;
% TestCase_B.RavenLimits_tranmax = 60; 
% TestCase_B.changingvar = 'd'; % Doesn't matter yet (Needs to be updated for next test phase)
% 
% TestCase_B.anatomies = {'VoxelData_SBSE10_14mm_08Apr2025.mat';
%                        'VoxelData_SBSE10_18mm_08Apr2025.mat';
%                        'VoxelData_SBSE10_22mm_08Apr2025.mat';
%                        'VoxelData_SBSE10_26mm_08Apr2025.mat'};
% 
% % IDs and Description Strings (Don't touch this)
% TestCase_B.environment = environment;
% TestCase_B.ID = [environment,'_', 'N', samplesize, '_RV_', RV, 'T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
% TestCase_B.descript = ['RV: ', RV, '   Target: ', target];



%% Code Dump (For code currently not in use) from fastfitnessfunctionvariablesegmentsnakerobot
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