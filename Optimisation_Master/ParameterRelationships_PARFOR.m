% Differential Evolution script
% SnakeRaven Optimisation on HPC
% Andrew Razjigaev 11 Feb 2021

clc;
clear;
close all;

%% Create Directory on HPC-Drive for all the results to go into:
addpath(pwd);
%Create a directory name based on the current time
directory = strcat('P_',strrep(strrep( datestr(datetime, 'dd-mm HH:MM:SS') ,':','_'),' ','_')); % PARAM RELATIONSHIP RESULTS
% directory = strcat('PRR_',strrep(strrep( datestr(datetime)              ,':','_'),' ','_')); 


%Create new directory ensure it doesn't already exist
[~, msg, ~] = mkdir(directory);
pause(5)

%If it already exists i.e. a message about it keeps appearing, try again until it works
%this happens if the job was run at the same time in seconds as another evolution job
while(~isempty(msg))
    directory = strcat('Snake_Evolution_Results',strrep(datestr(datetime),':','_'));
    [~, msg, ~] = mkdir(directory);
    pause(3)
end

disp('All fitness results in this logfile are being saved in folder:');
disp(directory)

%Add path to directory
addpath(directory);

%% Save diary (command window)
diary( strcat( directory, '/', 'diary', strrep(datestr(datetime),':','_')) )

choose_samplesize = 5*1e8;

%% Test Cases
%% TEST CASE : a 1 
for foldcase = 1
    % Change the following to suit test case:
    RV = 'F'; % Translational & Rotational & Full
    target = 'SE10'; % Direct Extruded T == TARGET
    environment = 'a_SB'; % Square Box

    samplesize = '5e8_w1d3n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

    TestCase_a1.N = choose_samplesize;

    TestCase_a1.changingvector = 90;

    TestCase_a1.alpha = deg2rad(90);
    TestCase_a1.w = 1;
    TestCase_a1.d = 3;
    TestCase_a1.n = 3;

    TestCase_a1.RavenLimits_yrot = pi/4;
    TestCase_a1.RavenLimits_xrot = pi/4;
    TestCase_a1.RavenLimits_tranmin = 0;
    TestCase_a1.RavenLimits_tranmax = 80;
    TestCase_a1.changingvar = 'alpha'; 

    TestCase_a1.anatomies = {'VoxelData_SBSE10_14mmw1_.mat';
                            'VoxelData_SBSE10_18mmw1_.mat';
                            'VoxelData_SBSE10_22mmw1_.mat';
                            'VoxelData_SBSE10_26mmw1_.mat'
                            'VoxelData_SBSE10_30mmw1_.mat'};

    % IDs and Description Strings (Don't touch this)
    TestCase_a1.environment = environment;
    TestCase_a1.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
    TestCase_a1.descript = ['RV: ', RV, '   Target: ', target];
end

%% TEST CASE : a 2 
for foldcase = 1
    % Change the following to suit test case:
    RV = 'F'; % Translational & Rotational & Full
    target = 'SE10'; % Direct Extruded T == TARGET
    environment = 'a_SB'; % Square Box

    samplesize = '5e8_w3d3n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

    TestCase_a2.N = choose_samplesize;

    TestCase_a2.changingvector = 90;

    TestCase_a2.alpha = deg2rad(90);
    TestCase_a2.w = 3;
    TestCase_a2.d = 3;
    TestCase_a2.n = 3;

    TestCase_a2.RavenLimits_yrot = pi/4;
    TestCase_a2.RavenLimits_xrot = pi/4;
    TestCase_a2.RavenLimits_tranmin = 0;
    TestCase_a2.RavenLimits_tranmax = 80;
    TestCase_a2.changingvar = 'alpha'; 

    TestCase_a2.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
                            'VoxelData_SBSE10_18mmw3_.mat';
                            'VoxelData_SBSE10_22mmw3_.mat';
                            'VoxelData_SBSE10_26mmw3_.mat'
                            'VoxelData_SBSE10_30mmw3_.mat'};

    % IDs and Description Strings (Don't touch this)
    TestCase_a2.environment = environment;
    TestCase_a2.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
    TestCase_a2.descript = ['RV: ', RV, '   Target: ', target];
end

%% TEST CASE : d 1 
for foldcase = 1
    % Change the following to suit test case:
    RV = 'F'; % Translational & Rotational & Full
    target = 'SE10'; % Direct Extruded T == TARGET
    environment = 'd_SB'; % Square Box

    samplesize = '5e8_w3d0n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

    TestCase_d1.N = choose_samplesize;

    TestCase_d1.changingvector = 1:1:10;

    TestCase_d1.alpha = deg2rad(90);
    TestCase_d1.w = 3;
    TestCase_d1.d = TestCase_d1.changingvector;
    TestCase_d1.n = 3;

    TestCase_d1.RavenLimits_yrot = pi/4;
    TestCase_d1.RavenLimits_xrot = pi/4;
    TestCase_d1.RavenLimits_tranmin = 0;
    TestCase_d1.RavenLimits_tranmax = 80;
    TestCase_d1.changingvar = 'd'; 

    TestCase_d1.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
                             'VoxelData_SBSE10_18mmw3_.mat';
                             'VoxelData_SBSE10_22mmw3_.mat';
                             'VoxelData_SBSE10_26mmw3_.mat'
                             'VoxelData_SBSE10_30mmw3_.mat'};

    % IDs and Description Strings (Don't touch this)
    TestCase_d1.environment = environment;
    TestCase_d1.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
    TestCase_d1.descript = ['RV: ', RV, '   Target: ', target];
end

%% TEST CASE : w 1, Widths 14mm-environment SE10
for foldcase = 1
    % Change the following to suit test case:

    RV = 'F'; % Translational & Rotational
    target = 'SE10'; % Direct Extruded T == TARGET
    environment = 'w_SB'; % square box

    samplesize = '5e8_w0d1n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

    TestCase_w1.N = choose_samplesize; 

    TestCase_w1.changingvector = 1:1:5;

    TestCase_w1.alpha = deg2rad(90);
    TestCase_w1.w = TestCase_w1.changingvector;
    TestCase_w1.d = 1;
    TestCase_w1.n = 3;

    TestCase_w1.RavenLimits_yrot = pi/4;
    TestCase_w1.RavenLimits_xrot = pi/4;
    TestCase_w1.RavenLimits_tranmin = 0;
    TestCase_w1.RavenLimits_tranmax = 80;
    TestCase_w1.changingvar = 'w'; 
    %
    TestCase_w1.anatomies = {'VoxelData_SBSE10_14mmw1_.mat';
                             'VoxelData_SBSE10_14mmw2_.mat';
                             'VoxelData_SBSE10_14mmw3_.mat';
                             'VoxelData_SBSE10_14mmw4_.mat';
                             'VoxelData_SBSE10_14mmw5_.mat'};

    % IDs and Description Strings (Don't touch this)
    TestCase_w1.environment = environment;
    TestCase_w1.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
    TestCase_w1.descript = ['RV: ', RV, '   Target: ', target];
end

%% TEST CASE : w 2, Widths 26mm-environment SE10
for foldcase = 1
    % Change the following to suit test case:

    RV = 'F'; % Translational & Rotational
    target = 'SE10'; % Direct Extruded T == TARGET
    environment = 'w_SB'; % square box

    samplesize = '5e8_w0d1n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

    TestCase_w2.N = choose_samplesize; 

    TestCase_w2.changingvector = 1:1:5;

    TestCase_w2.alpha = deg2rad(90);
    TestCase_w2.w = TestCase_w2.changingvector;
    TestCase_w2.d = 1;
    TestCase_w2.n = 3;

    TestCase_w2.RavenLimits_yrot = pi/4;
    TestCase_w2.RavenLimits_xrot = pi/4;
    TestCase_w2.RavenLimits_tranmin = 0;
    TestCase_w2.RavenLimits_tranmax = 80;
    TestCase_w2.changingvar = 'w'; 
    
    TestCase_w2.anatomies = {'VoxelData_SBSE10_26mmw1_.mat';
                             'VoxelData_SBSE10_26mmw2_.mat';
                             'VoxelData_SBSE10_26mmw3_.mat';
                             'VoxelData_SBSE10_26mmw4_.mat';
                             'VoxelData_SBSE10_26mmw5_.mat'};

    % IDs and Description Strings (Don't touch this)
    TestCase_w2.environment = environment;
    TestCase_w2.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
    TestCase_w2.descript = ['RV: ', RV, '   Target: ', target];
end

%% TEST CASE : w 3, Widths 18mm-environment SE10
for foldcase = 1
    % Change the following to suit test case:

    RV = 'F'; % Translational & Rotational
    target = 'SE10'; % Direct Extruded T == TARGET
    environment = 'w3_SB'; % square box

    samplesize = '5e8_w0d1n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

    TestCase_w3.N = choose_samplesize; 

    TestCase_w3.changingvector = 1:1:5;

    TestCase_w3.alpha = deg2rad(90);
    TestCase_w3.w = TestCase_w3.changingvector;
    TestCase_w3.d = 1;
    TestCase_w3.n = 3;

    TestCase_w3.RavenLimits_yrot = pi/4;
    TestCase_w3.RavenLimits_xrot = pi/4;
    TestCase_w3.RavenLimits_tranmin = 0;
    TestCase_w3.RavenLimits_tranmax = 80;
    TestCase_w3.changingvar = 'w'; 
    
    TestCase_w3.anatomies = {'VoxelData_SBSE10_18mmw1_.mat';
                             'VoxelData_SBSE10_18mmw2_.mat';
                             'VoxelData_SBSE10_18mmw3_.mat';
                             'VoxelData_SBSE10_18mmw4_.mat';
                             'VoxelData_SBSE10_18mmw5_.mat'};

    % IDs and Description Strings (Don't touch this)
    TestCase_w3.environment = environment;
    TestCase_w3.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
    TestCase_w3.descript = ['RV: ', RV, '   Target: ', target];
end

%% TEST CASE : w 4, Widths 14mm-environment SE20
for foldcase = 1
    % Change the following to suit test case:

    RV = 'F'; % Translational & Rotational
    target = 'SE20'; % Direct Extruded T == TARGET
    environment = 'w4_SB'; % square box

    samplesize = '5e8_w0d1n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

    TestCase_w4.N = choose_samplesize; 

    TestCase_w4.changingvector = 1:1:5;

    TestCase_w4.alpha = deg2rad(90);
    TestCase_w4.w = TestCase_w4.changingvector;
    TestCase_w4.d = 1;
    TestCase_w4.n = 3;

    TestCase_w4.RavenLimits_yrot = pi/4;
    TestCase_w4.RavenLimits_xrot = pi/4;
    TestCase_w4.RavenLimits_tranmin = 0;
    TestCase_w4.RavenLimits_tranmax = 80;
    TestCase_w4.changingvar = 'w'; 
    
    TestCase_w4.anatomies = {'VoxelData_SBSE20_14mmw1_.mat';
                             'VoxelData_SBSE20_14mmw2_.mat';
                             'VoxelData_SBSE20_14mmw3_.mat';
                             'VoxelData_SBSE20_14mmw4_.mat';
                             'VoxelData_SBSE20_14mmw5_.mat'};

    % IDs and Description Strings (Don't touch this)
    TestCase_w4.environment = environment;
    TestCase_w4.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
    TestCase_w4.descript = ['RV: ', RV, '   Target: ', target];
end

%% TEST CASE : w 5, Widths 26mm-environment SE20
for foldcase = 1
    % Change the following to suit test case:

    RV = 'F'; % Translational & Rotational
    target = 'SE20'; % Direct Extruded T == TARGET
    environment = 'w5_SB'; % square box

    samplesize = '5e8_w0d1n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

    TestCase_w5.N = choose_samplesize; 

    TestCase_w5.changingvector = 1:1:5;

    TestCase_w5.alpha = deg2rad(90);
    TestCase_w5.w = TestCase_w5.changingvector;
    TestCase_w5.d = 1;
    TestCase_w5.n = 3;

    TestCase_w5.RavenLimits_yrot = pi/4;
    TestCase_w5.RavenLimits_xrot = pi/4;
    TestCase_w5.RavenLimits_tranmin = 0;
    TestCase_w5.RavenLimits_tranmax = 80;
    TestCase_w5.changingvar = 'w'; 
    
    TestCase_w5.anatomies = {'VoxelData_SBSE20_26mmw1_.mat';
                             'VoxelData_SBSE20_26mmw2_.mat';
                             'VoxelData_SBSE20_26mmw3_.mat';
                             'VoxelData_SBSE20_26mmw4_.mat';
                             'VoxelData_SBSE20_26mmw5_.mat'};

    % IDs and Description Strings (Don't touch this)
    TestCase_w5.environment = environment;
    TestCase_w5.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
    TestCase_w5.descript = ['RV: ', RV, '   Target: ', target];
end
%% TEST CASE : w 6, Widths 18mm-environment SE20
for foldcase = 1
    % Change the following to suit test case:

    RV = 'F'; % Translational & Rotational
    target = 'SE20'; % Direct Extruded T == TARGET
    environment = 'w6_SB'; % square box

    samplesize = '5e8_w0d1n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

    TestCase_w6.N = choose_samplesize; 

    TestCase_w6.changingvector = 1:1:5;

    TestCase_w6.alpha = deg2rad(90);
    TestCase_w6.w = TestCase_w6.changingvector;
    TestCase_w6.d = 1;
    TestCase_w6.n = 3;

    TestCase_w6.RavenLimits_yrot = pi/4;
    TestCase_w6.RavenLimits_xrot = pi/4;
    TestCase_w6.RavenLimits_tranmin = 0;
    TestCase_w6.RavenLimits_tranmax = 80;
    TestCase_w6.changingvar = 'w'; 
    
    TestCase_w6.anatomies = {'VoxelData_SBSE20_18mmw1_.mat';
                             'VoxelData_SBSE20_18mmw2_.mat';
                             'VoxelData_SBSE20_18mmw3_.mat';
                             'VoxelData_SBSE20_18mmw4_.mat';
                             'VoxelData_SBSE20_18mmw5_.mat'};

    % IDs and Description Strings (Don't touch this)
    TestCase_w6.environment = environment;
    TestCase_w6.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
    TestCase_w6.descript = ['RV: ', RV, '   Target: ', target];
end

%% TEST CASE : n 1 SE10
for foldcase = 1
    % Change the following to suit test case:

    RV = 'F'; % Translational & Rotational
    target = 'SE10'; % Direct Extruded T == TARGET
    environment = 'n_SB'; % square box

    samplesize = '5e8_w3d1n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

    TestCase_n1.N = choose_samplesize;

    TestCase_n1.changingvector = 1:1:10;

    TestCase_n1.alpha = deg2rad(90);
    TestCase_n1.w = 3;
    TestCase_n1.d = 1;
    TestCase_n1.n = TestCase_n1.changingvector;

    TestCase_n1.RavenLimits_yrot = pi/4;
    TestCase_n1.RavenLimits_xrot = pi/4;
    TestCase_n1.RavenLimits_tranmin = 0;
    TestCase_n1.RavenLimits_tranmax = 80;
    TestCase_n1.changingvar = 'n'; 
    
    TestCase_n1.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
                             'VoxelData_SBSE10_18mmw3_.mat';
                             'VoxelData_SBSE10_22mmw3_.mat';
                             'VoxelData_SBSE10_26mmw3_.mat';
                             'VoxelData_SBSE10_30mmw3_.mat'};

    % IDs and Description Strings (Don't touch this)
    TestCase_n1.environment = environment;
    TestCase_n1.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
    TestCase_n1.descript = ['RV: ', RV, '   Target: ', target];
end

%% TEST CASE : n 2 SE20
for foldcase = 1
    % Change the following to suit test case:

    RV = 'F'; % Translational & Rotational
    target = 'SE20'; % Direct Extruded T == TARGET
    environment = 'n2_SB'; % square box

    samplesize = '5e8_w3d1n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

    TestCase_n2.N = choose_samplesize;

    TestCase_n2.changingvector = 1:1:10;

    TestCase_n2.alpha = deg2rad(90);
    TestCase_n2.w = 3;
    TestCase_n2.d = 1;
    TestCase_n2.n = TestCase_n2.changingvector;

    TestCase_n2.RavenLimits_yrot = pi/4;
    TestCase_n2.RavenLimits_xrot = pi/4;
    TestCase_n2.RavenLimits_tranmin = 0;
    TestCase_n2.RavenLimits_tranmax = 80;
    TestCase_n2.changingvar = 'n'; 
    
    TestCase_n2.anatomies = {'VoxelData_SBSE20_14mmw3_.mat';
                             'VoxelData_SBSE20_18mmw3_.mat';
                             'VoxelData_SBSE20_22mmw3_.mat';
                             'VoxelData_SBSE20_26mmw3_.mat';
                             'VoxelData_SBSE20_30mmw3_.mat'};

    % IDs and Description Strings (Don't touch this)
    TestCase_n2.environment = environment;
    TestCase_n2.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
    TestCase_n2.descript = ['RV: ', RV, '   Target: ', target];
end

%% TEST CASE : wd 1 
for foldcase = 1
    % Change the following to suit test case:

    RV = 'F'; % Translational & Rotational
    target = 'SE10'; % Direct Extruded T == TARGET
    environment = 'wd_SB'; % square box

    samplesize = '5e8_w1d0n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

    TestCase_wd1.N = choose_samplesize;

    TestCase_wd1.changingvector = 1:1:10;

    TestCase_wd1.alpha = deg2rad(90);
    TestCase_wd1.w = 1;
    TestCase_wd1.d = TestCase_wd1.changingvector;
    TestCase_wd1.n = 3;

    TestCase_wd1.RavenLimits_yrot = pi/4;
    TestCase_wd1.RavenLimits_xrot = pi/4;
    TestCase_wd1.RavenLimits_tranmin = 0;
    TestCase_wd1.RavenLimits_tranmax = 80;
    TestCase_wd1.changingvar = 'd'; 
    
    TestCase_wd1.anatomies = {'VoxelData_SBSE10_14mmw1_.mat';
                              'VoxelData_SBSE10_18mmw1_.mat';
                              'VoxelData_SBSE10_22mmw1_.mat';
                              'VoxelData_SBSE10_26mmw1_.mat';
                              'VoxelData_SBSE10_30mmw1_.mat'};

    % IDs and Description Strings (Don't touch this)
    TestCase_wd1.environment = environment;
    TestCase_wd1.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
    TestCase_wd1.descript = ['RV: ', RV, '   Target: ', target];
end

%% TEST CASE : wd 2 
for foldcase = 1
    % Change the following to suit test case:
    RV = 'F'; % Translational & Rotational
    target = 'SE10'; % Direct Extruded T == TARGET
    environment = 'wd_SB'; % square box

    samplesize = '5e8_w2d0n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

    TestCase_wd2.N = choose_samplesize;

    TestCase_wd2.changingvector = 1:1:10;

    TestCase_wd2.alpha = deg2rad(90);
    TestCase_wd2.w = 2;
    TestCase_wd2.d = TestCase_wd2.changingvector;
    TestCase_wd2.n = 3;

    TestCase_wd2.RavenLimits_yrot = pi/4;
    TestCase_wd2.RavenLimits_xrot = pi/4;
    TestCase_wd2.RavenLimits_tranmin = 0;
    TestCase_wd2.RavenLimits_tranmax = 80;
    TestCase_wd2.changingvar = 'd'; 
    
    TestCase_wd2.anatomies = {'VoxelData_SBSE10_14mmw2_.mat';
                              'VoxelData_SBSE10_18mmw2_.mat';
                              'VoxelData_SBSE10_22mmw2_.mat';
                              'VoxelData_SBSE10_26mmw2_.mat';
                              'VoxelData_SBSE10_30mmw2_.mat'};

    % IDs and Description Strings (Don't touch this)
    TestCase_wd2.environment = environment;
    TestCase_wd2.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
    TestCase_wd2.descript = ['RV: ', RV, '   Target: ', target];
end

%% TEST CASE : wd 3 
for foldcase = 1
    % Change the following to suit test case:
    RV = 'F'; % Translational & Rotational
    target = 'SE10'; % Direct Extruded T == TARGET
    environment = 'wd_SB'; % square box

    samplesize = '5e8_w3d0n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

    TestCase_wd3.N = choose_samplesize;

    TestCase_wd3.changingvector = 1:1:10;

    TestCase_wd3.alpha = deg2rad(90);
    TestCase_wd3.w = 3;
    TestCase_wd3.d = TestCase_wd3.changingvector;
    TestCase_wd3.n = 3;

    TestCase_wd3.RavenLimits_yrot = pi/4;
    TestCase_wd3.RavenLimits_xrot = pi/4;
    TestCase_wd3.RavenLimits_tranmin = 0;
    TestCase_wd3.RavenLimits_tranmax = 80;
    TestCase_wd3.changingvar = 'd'; 
    
    TestCase_wd3.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
                              'VoxelData_SBSE10_18mmw3_.mat';
                              'VoxelData_SBSE10_22mmw3_.mat';
                              'VoxelData_SBSE10_26mmw3_.mat';
                              'VoxelData_SBSE10_30mmw3_.mat'};

    % IDs and Description Strings (Don't touch this)
    TestCase_wd3.environment = environment;
    TestCase_wd3.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
    TestCase_wd3.descript = ['RV: ', RV, '   Target: ', target];
end

%% TEST CASE : wn 1 
for foldcase = 1
    % Change the following to suit test case:
    RV = 'F'; % Translational & Rotational
    target = 'SE10'; % Direct Extruded T == TARGET
    environment = 'wn_SB'; % square box

    samplesize = '5e8_w1d1n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

    TestCase_wn1.N = choose_samplesize;

    TestCase_wn1.changingvector = 1:1:10;

    TestCase_wn1.alpha = deg2rad(90);
    TestCase_wn1.w = 1;
    TestCase_wn1.d = 1;
    TestCase_wn1.n = TestCase_wn1.changingvector;

    TestCase_wn1.RavenLimits_yrot = pi/4;
    TestCase_wn1.RavenLimits_xrot = pi/4;
    TestCase_wn1.RavenLimits_tranmin = 0;
    TestCase_wn1.RavenLimits_tranmax = 80;
    TestCase_wn1.changingvar = 'n'; 
    
    TestCase_wn1.anatomies = {'VoxelData_SBSE10_14mmw1_.mat';
                              'VoxelData_SBSE10_18mmw1_.mat';
                              'VoxelData_SBSE10_22mmw1_.mat';
                              'VoxelData_SBSE10_26mmw1_.mat';
                              'VoxelData_SBSE10_30mmw1_.mat'};

    % IDs and Description Strings (Don't touch this)
    TestCase_wn1.environment = environment;
    TestCase_wn1.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
    TestCase_wn1.descript = ['RV: ', RV, '   Target: ', target];
end

%% TEST CASE : wn 2 
for foldcase = 1
    % Change the following to suit test case:
    RV = 'F'; % Translational & Rotational
    target = 'SE10'; % Direct Extruded T == TARGET
    environment = 'wn_SB'; % square box

    samplesize = '5e8_w2d1n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

    TestCase_wn2.N = choose_samplesize;

    TestCase_wn2.changingvector = 1:1:10;

    TestCase_wn2.alpha = deg2rad(90);
    TestCase_wn2.w = 2;
    TestCase_wn2.d = 1;
    TestCase_wn2.n = TestCase_wn2.changingvector;

    TestCase_wn2.RavenLimits_yrot = pi/4;
    TestCase_wn2.RavenLimits_xrot = pi/4;
    TestCase_wn2.RavenLimits_tranmin = 0;
    TestCase_wn2.RavenLimits_tranmax = 80;
    TestCase_wn2.changingvar = 'n'; 
    
    TestCase_wn2.anatomies = {'VoxelData_SBSE10_14mmw2_.mat';
                              'VoxelData_SBSE10_18mmw2_.mat';
                              'VoxelData_SBSE10_22mmw2_.mat';
                              'VoxelData_SBSE10_26mmw2_.mat';
                              'VoxelData_SBSE10_30mmw2_.mat'};

    % IDs and Description Strings (Don't touch this)
    TestCase_wn2.environment = environment;
    TestCase_wn2.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
    TestCase_wn2.descript = ['RV: ', RV, '   Target: ', target];
end

%% TEST CASE : wn 3 
for foldcase = 1

    % Change the following to suit test case:
    RV = 'F'; % Translational & Rotational
    target = 'SE10'; % Direct Extruded T == TARGET
    environment = 'wn_SB'; % square box

    samplesize = '5e8_w3d1n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

    TestCase_wn3.N = choose_samplesize;

    TestCase_wn3.changingvector = 1:1:10;

    TestCase_wn3.alpha = deg2rad(90);
    TestCase_wn3.w = 3;
    TestCase_wn3.d = 1;
    TestCase_wn3.n = TestCase_wn3.changingvector;

    TestCase_wn3.RavenLimits_yrot = pi/4;
    TestCase_wn3.RavenLimits_xrot = pi/4;
    TestCase_wn3.RavenLimits_tranmin = 0;
    TestCase_wn3.RavenLimits_tranmax = 80;
    TestCase_wn3.changingvar = 'n'; 
    
    TestCase_wn3.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
                              'VoxelData_SBSE10_18mmw3_.mat';
                              'VoxelData_SBSE10_22mmw3_.mat';
                              'VoxelData_SBSE10_26mmw3_.mat';
                              'VoxelData_SBSE10_30mmw3_.mat'};

    % IDs and Description Strings (Don't touch this)
    TestCase_wn3.environment = environment;
    TestCase_wn3.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
    TestCase_wn3.descript = ['RV: ', RV, '   Target: ', target];
end

%% TEST CASE : nd 1 (d = 1)
for foldcase = 1
    
    % Change the following to suit test case:
    RV = 'F'; % Translational & Rotational
    target = 'SE10'; % Direct Extruded T == TARGET
    environment = 'nd_SB'; % square box

    samplesize = '5e8_w3d1n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

    TestCase_nd1.N = choose_samplesize;

    TestCase_nd1.changingvector = 1:1:10;

    TestCase_nd1.alpha = deg2rad(90);
    TestCase_nd1.w = 3;
    TestCase_nd1.d = 1;
    TestCase_nd1.n = TestCase_nd1.changingvector;

    TestCase_nd1.RavenLimits_yrot = pi/4;
    TestCase_nd1.RavenLimits_xrot = pi/4;
    TestCase_nd1.RavenLimits_tranmin = 0;
    TestCase_nd1.RavenLimits_tranmax = 80;
    TestCase_nd1.changingvar = 'n'; 
    
    TestCase_nd1.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
                              'VoxelData_SBSE10_18mmw3_.mat';
                              'VoxelData_SBSE10_22mmw3_.mat';
                              'VoxelData_SBSE10_26mmw3_.mat';
                              'VoxelData_SBSE10_30mmw3_.mat'};

    % IDs and Description Strings (Don't touch this)
    TestCase_nd1.environment = environment;
    TestCase_nd1.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
    TestCase_nd1.descript = ['RV: ', RV, '   Target: ', target];
end

%% TEST CASE : nd 2 (d = 2)
for foldcase = 1
    
    % Change the following to suit test case:
    RV = 'F'; % Translational & Rotational
    target = 'SE10'; % Direct Extruded T == TARGET
    environment = 'nd_SB'; % square box

    samplesize = '5e8_w3d2n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

    TestCase_nd2.N = choose_samplesize;

    TestCase_nd2.changingvector = 1:1:10;

    TestCase_nd2.alpha = deg2rad(90);
    TestCase_nd2.w = 3;
    TestCase_nd2.d = 2;
    TestCase_nd2.n = TestCase_nd2.changingvector;

    TestCase_nd2.RavenLimits_yrot = pi/4;
    TestCase_nd2.RavenLimits_xrot = pi/4;
    TestCase_nd2.RavenLimits_tranmin = 0;
    TestCase_nd2.RavenLimits_tranmax = 80;
    TestCase_nd2.changingvar = 'n'; 
    
    TestCase_nd2.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
                              'VoxelData_SBSE10_18mmw3_.mat';
                              'VoxelData_SBSE10_22mmw3_.mat';
                              'VoxelData_SBSE10_26mmw3_.mat';
                              'VoxelData_SBSE10_30mmw3_.mat'};

    % IDs and Description Strings (Don't touch this)
    TestCase_nd2.environment = environment;
    TestCase_nd2.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
    TestCase_nd2.descript = ['RV: ', RV, '   Target: ', target];
end

%% TEST CASE : nd 3 (d = 3)
for foldcase = 1
    
    % Change the following to suit test case:
    RV = 'F'; % Translational & Rotational
    target = 'SE10'; % Direct Extruded T == TARGET
    environment = 'nd_SB'; % square box

    samplesize = '5e8_w3d3n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

    TestCase_nd3.N = choose_samplesize;

    TestCase_nd3.changingvector = 1:1:10;

    TestCase_nd3.alpha = deg2rad(90);
    TestCase_nd3.w = 3;
    TestCase_nd3.d = 3;
    TestCase_nd3.n = TestCase_nd3.changingvector;

    TestCase_nd3.RavenLimits_yrot = pi/4;
    TestCase_nd3.RavenLimits_xrot = pi/4;
    TestCase_nd3.RavenLimits_tranmin = 0;
    TestCase_nd3.RavenLimits_tranmax = 80;
    TestCase_nd3.changingvar = 'n'; 
    
    TestCase_nd3.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
                              'VoxelData_SBSE10_18mmw3_.mat';
                              'VoxelData_SBSE10_22mmw3_.mat';
                              'VoxelData_SBSE10_26mmw3_.mat';
                              'VoxelData_SBSE10_30mmw3_.mat'};

    % IDs and Description Strings (Don't touch this)
    TestCase_nd3.environment = environment;
    TestCase_nd3.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
    TestCase_nd3.descript = ['RV: ', RV, '   Target: ', target];
end

%% TEST CASE : nd 4 (d = 5)
for foldcase = 1
    
    % Change the following to suit test case:
    RV = 'F'; % Translational & Rotational
    target = 'SE10'; % Direct Extruded T == TARGET
    environment = 'nd_SB'; % square box

    samplesize = '5e8_w3d5n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

    TestCase_nd4.N = choose_samplesize;

    TestCase_nd4.changingvector = 1:1:10;

    TestCase_nd4.alpha = deg2rad(90);
    TestCase_nd4.w = 3;
    TestCase_nd4.d = 5;
    TestCase_nd4.n = TestCase_nd4.changingvector;

    TestCase_nd4.RavenLimits_yrot = pi/4;
    TestCase_nd4.RavenLimits_xrot = pi/4;
    TestCase_nd4.RavenLimits_tranmin = 0;
    TestCase_nd4.RavenLimits_tranmax = 80;
    TestCase_nd4.changingvar = 'n'; 
    
    TestCase_nd4.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
                              'VoxelData_SBSE10_18mmw3_.mat';
                              'VoxelData_SBSE10_22mmw3_.mat';
                              'VoxelData_SBSE10_26mmw3_.mat';
                              'VoxelData_SBSE10_30mmw3_.mat'};

    % IDs and Description Strings (Don't touch this)
    TestCase_nd4.environment = environment;
    TestCase_nd4.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
    TestCase_nd4.descript = ['RV: ', RV, '   Target: ', target];
end

%% CASES TO BE RUN 
Cases = [TestCase_a1, TestCase_a2,...
    TestCase_d1, ...
    TestCase_w1, TestCase_w2, ...
    TestCase_n1,  ...
    TestCase_wd1, TestCase_wd2, TestCase_wd3, ...
    TestCase_wn1, TestCase_wn2, TestCase_wn3, ...
    TestCase_nd1,  TestCase_nd2,  TestCase_nd3,  TestCase_nd4]; 

%% Set up parallel pool

poolobj = parpool('local',[2 30],'SpmdEnabled',false,'IdleTimeout',60);
disp(poolobj)

%% Select test case / MAIN
for casecase = 1:length(Cases)

    CurrentCase = Cases(casecase);
    
    disp(' ')
    disp(' ')
    disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
    disp(['Current Case: ', CurrentCase.ID])
    disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
   
    sample_size = CurrentCase(1).N;% 30 *1e6;%  1.5*1e6;
    disp(['Configuration sample size:', num2str(sample_size)])

    % % Entrance frame
    % Entranceframe = [Ry(deg2rad(-90)) [0 0 30]'; 0 0 0 1];

    MaxIt = 1;
    alpha = CurrentCase(1).alpha;% 35 deg2rad(5):deg2rad(10)-deg2rad(5):deg2rad(90);
    w = CurrentCase(1).w;
    d = CurrentCase(1).d; 
    n = CurrentCase(1).n;

    changingvar = CurrentCase.changingvar; %% Change i-for-loop accordingly

    % Test set up includes variables required for cost function
    testsetup.descript = CurrentCase.descript;
    testsetup.ID = CurrentCase.ID;
    testsetup.RavenLimits_yrot = CurrentCase.RavenLimits_yrot;
    testsetup.RavenLimits_xrot = CurrentCase.RavenLimits_xrot;
    testsetup.RavenLimits_tranmin = CurrentCase.RavenLimits_tranmin;
    testsetup.RavenLimits_tranmax = CurrentCase.RavenLimits_tranmax;

    disp('  ')
    disp('Test Details:')
    disp(testsetup)
    disp('  ')
    anatomies = CurrentCase(1).anatomies;


    %% Create sub Directory on HPC-Drive for all the results to go into:
    addpath(pwd);

    %Create a directory name based on the current time
    TestID =  testsetup.ID;
    directory2 = strcat(TestID);

    %Create new directory ensure it doesn't already exist
    [~, msg, ~] = mkdir(directory, directory2); % [~, msg, ~] 
    pause(5)

    disp('Results are being saved in folder:');
    disp(directory2)

    %Add path to directory
    addpath(fullfile(directory, directory2));

    directory3 = strcat(directory, '/', directory2);
    %% DE Parameters

    if changingvar == 'n'
        nPop= length(n);
    elseif changingvar == 'd'
        nPop= length(d);
    elseif changingvar == 'w'
        nPop= 1; %length(w);
    elseif changingvar == 'alpha'
        nPop= length(alpha);
    end
    % Population Size

    %% Main Loop

    Costs = zeros(nPop,length(anatomies));

    for j = 1:length(anatomies)
        disp(' ')
        disp('------------------------------------------------------------------------------------------------------------------')
        disp(' ')
        % Environment setup
        Anatomyfilename = anatomies{j};
        disp('Using Anatomy file:')
        disp(Anatomyfilename)

        %Voxel Map
        Voxels = load(Anatomyfilename,'Voxel_data');

        % Cost Function
        CostFunction=@(design) FastFitnessFunctionVariableSegmentSnakeRobotPARAMPARFOR(design,sample_size,Voxels,directory3, testsetup);

        disp('Start') ;%Starting Snake Evolution Algorithm Creating Initial Population:');

        rng('shuffle');

        empty_individual.Position=[];
        empty_individual.Cost=[];
        empty_individual.Time=[];

        % BestSol.Cost=inf;

        pop = repmat(empty_individual,nPop,1);

        %Create Cell array recording all populations over time
        Allpop = cell(nPop,MaxIt+1);
        Allcost = cell(nPop,MaxIt+1);
        Alltime = cell(nPop,MaxIt+1);

        %Count the number of function evaluations and repeats
        repeat = 0;
        func_iter = 0;

        disp('Begin Evaluation');

        for i=1:nPop
            % initial population within bound %unifrnd(VarMin,VarMax,VarSize);

            if changingvar == 'n'
                pop(i).Position= [alpha, n(i), d]; % generate_random_design(VarMin,VarMax); %% CHANGE CHANGING VAR %%
            elseif changingvar == 'd'
                pop(i).Position= [alpha, n, d(i)]; % generate_random_design(VarMin,VarMax); %% CHANGE CHANGING VAR %%
            % % % % % elseif changingvar == 'w'
            % % % % % 
            elseif changingvar == 'alpha'
                pop(i).Position= [alpha(i), n, d]; % generate_random_design(VarMin,VarMax); %% CHANGE CHANGING VAR %%
            elseif changingvar == 'w'
                pop(i).Position= [alpha, n, d];
                w = str2num(extractBefore(extractAfter(Anatomyfilename, 'w'), '_'));
                disp('w:')
                disp(w)
            end
            

            % Run the Fitness Function
            disp(['Testing member ' num2str(i) ' of generation 0']);
            disp('Evaluating design: ')
            disp(vector2designstruct(pop(i).Position, w))

            %Check if the design has already been tested:
            [was_tested, prior_cost, prior_time] = is_member_already_tested(pop(i).Position,Allpop,Allcost,Alltime);

            if was_tested
                repeat = repeat + 1;
                disp('Already Evaluated skipping recalculation')
                pop(i).Cost = prior_cost;
                pop(i).Time = prior_time;
            else
                %Unique Design needs To be calculated
                func_iter = func_iter + 1;
                % TrajandTendPlotsetup(1, i, vector2designstruct(pop(i).Position), Voxels, Entranceframe  )

                tic
                pop(i).Cost=-1*CostFunction(vector2designstruct(pop(i).Position, w));
                Costs(i, j) = -pop(i).Cost;
                toc
                pop(i).Time = toc;

            end

            disp('Dexterity score for This design was:')
            disp(-1*pop(i).Cost)

            % if pop(i).Cost<BestSol.Cost
            %     BestSol=pop(i);
            % end

            %Record population member and data:
            Allpop{i,1} = pop(i).Position;
            Allcost{i,1} = pop(i).Cost;
            Alltime{i,1} = pop(i).Time;
        end

        disp('Evaluation has finished...');
        BestCost=zeros(MaxIt,1);
        disp(' ')
        
    end

    % RResults_out = struct('Results',RResults);
    % %Save the Results based on the design parameters
    % result_file = strcat('Results');
    %%

    if changingvar == 'w'
        colNames = CurrentCase.anatomies'; % Cols are environments
        Costs_table = array2table(Costs, 'VariableNames',colNames);
    else
        colNames = [CurrentCase.changingvar, CurrentCase.anatomies']; % Cols are environments
        Costs_table = array2table([CurrentCase.changingvector', Costs], 'VariableNames',colNames);
    end

    save([directory3, '/', 'Costs'], 'Costs');
    save([directory3, '/', 'CostsTable'], 'Costs_table');

    %%

    figure(4)
    hold on
    % for s = 1:1:size(Costs,2)
    %     plot(CurrentCase.changingvector, Costs(:,s))
    % end
    bar(CurrentCase.changingvector, Costs')
    das = extractBefore( extractAfter(CurrentCase.anatomies', [CurrentCase.environment, '_']), '_' );

    legend( das, 'Location', 'southoutside','Interpreter', 'none', 'NumColumns', 10);
    title(['Dexterity: Relationship between ', CurrentCase.changingvar, ' and Environment' ])
    subtitle(CurrentCase.ID)
    xlabel(CurrentCase.changingvar)
    ylabel('Dexterity Score')

    ytickformat('%.4f');
    ax = gca;
    ax.YAxis.Exponent = 0;
    hold off

    %
    figure(5)
    hold on
    das = extractBefore( extractAfter(CurrentCase.anatomies', [CurrentCase.environment, '_']), '_' );
    bar(das, Costs)
    leg = arrayfun(@(x) num2str(x), CurrentCase.changingvector,  'UniformOutput', false); % num2str(CurrentCase.changingvector);

    legend( leg, 'Location', 'southoutside','Interpreter', 'none', 'NumColumns', 10);
    title(['Dexterity: Relationship between ', CurrentCase.changingvar, ' and Environment' ])
    subtitle(CurrentCase.ID)
    xlabel('Environment')
    ylabel('Dexterity Score')

    ytickformat('%.4f');
    ax = gca;
    ax.YAxis.Exponent = 0;
    hold off


    figfiledirect = strcat(directory3,'/', 'Costs1', '.fig');
    savefig(4, figfiledirect );

    figfiledirect = strcat(directory3,'/', 'Costs2', '.fig');
    savefig(5, figfiledirect );
    pause(1)
    close all

end


%End parallel loop delete the pool object
delete(poolobj)
diary off

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
