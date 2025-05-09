%% S for small environments and reduced n count

% %% TEST CASE : w S1, Widths 12mm-environment SE10 
% for foldcase = 1
%     % Change the following to suit test case:
% 
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'wS1_SB'; % square box
% 
%     samplesize = '5e8_w0d1n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_wS1.N = choose_samplesize; 
% 
%     TestCase_wS1.changingvector = 1:1:5;
% 
%     TestCase_wS1.alpha = deg2rad(90);
%     TestCase_wS1.w = TestCase_wS1.changingvector;
%     TestCase_wS1.d = 1;
%     TestCase_wS1.n = 3;
% 
%     TestCase_wS1.RavenLimits_yrot = pi/4;
%     TestCase_wS1.RavenLimits_xrot = pi/4;
%     TestCase_wS1.RavenLimits_tranmin = 0;
%     TestCase_wS1.RavenLimits_tranmax = 80;
%     TestCase_wS1.changingvar = 'w'; 
% 
%     TestCase_wS1.anatomies = {'VoxelData_SBSE10_12mmw1_.mat';
%                              'VoxelData_SBSE10_12mmw2_.mat';
%                              'VoxelData_SBSE10_12mmw3_.mat';
%                              'VoxelData_SBSE10_12mmw4_.mat';
%                              'VoxelData_SBSE10_12mmw5_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_wS1.environment = environment;
%     TestCase_wS1.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_wS1.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : w S2, Widths 12mm-environment SE20
% for foldcase = 1
%     % Change the following to suit test case:
% 
%     RV = 'F'; % Translational & Rotational
%     target = 'SE20'; % Direct Extruded T == TARGET
%     environment = 'wS2_SB'; % square box
% 
%     samplesize = '5e8_w0d1n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_wS2.N = choose_samplesize; 
% 
%     TestCase_wS2.changingvector = 1:1:5;
% 
%     TestCase_wS2.alpha = deg2rad(90);
%     TestCase_wS2.w = TestCase_wS2.changingvector;
%     TestCase_wS2.d = 1;
%     TestCase_wS2.n = 3;
% 
%     TestCase_wS2.RavenLimits_yrot = pi/4;
%     TestCase_wS2.RavenLimits_xrot = pi/4;
%     TestCase_wS2.RavenLimits_tranmin = 0;
%     TestCase_wS2.RavenLimits_tranmax = 80;
%     TestCase_wS2.changingvar = 'w'; 
% 
%     TestCase_wS2.anatomies = {'VoxelData_SBSE20_12mmw1_.mat';
%                              'VoxelData_SBSE20_12mmw2_.mat';
%                              'VoxelData_SBSE20_12mmw3_.mat';
%                              'VoxelData_SBSE20_12mmw4_.mat';
%                              'VoxelData_SBSE20_12mmw5_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_wS2.environment = environment;
%     TestCase_wS2.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_wS2.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : w S3, Widths 14mm-environment SE10
% for foldcase = 1
%     % Change the following to suit test case:
% 
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'wS3_SB'; % square box
% 
%     samplesize = '5e8_w0d1n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_wS3.N = choose_samplesize; 
% 
%     TestCase_wS3.changingvector = 1:1:5;
% 
%     TestCase_wS3.alpha = deg2rad(90);
%     TestCase_wS3.w = TestCase_wS3.changingvector;
%     TestCase_wS3.d = 1;
%     TestCase_wS3.n = 3;
% 
%     TestCase_wS3.RavenLimits_yrot = pi/4;
%     TestCase_wS3.RavenLimits_xrot = pi/4;
%     TestCase_wS3.RavenLimits_tranmin = 0;
%     TestCase_wS3.RavenLimits_tranmax = 80;
%     TestCase_wS3.changingvar = 'w'; 
%     %
%     TestCase_wS3.anatomies = {'VoxelData_SBSE10_10mmw1_.mat';
%                              'VoxelData_SBSE10_10mmw2_.mat';
%                              'VoxelData_SBSE10_10mmw3_.mat';
%                              'VoxelData_SBSE10_10mmw4_.mat';
%                              'VoxelData_SBSE10_10mmw5_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_wS3.environment = environment;
%     TestCase_wS3.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_wS3.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : w S4, Widths 10mm-environment SE20
% for foldcase = 1
%     % Change the following to suit test case:
% 
%     RV = 'F'; % Translational & Rotational
%     target = 'SE20'; % Direct Extruded T == TARGET
%     environment = 'wS4_SB'; % square box
% 
%     samplesize = '5e8_w0d1n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_wS4.N = choose_samplesize; 
% 
%     TestCase_wS4.changingvector = 1:1:5;
% 
%     TestCase_wS4.alpha = deg2rad(90);
%     TestCase_wS4.w = TestCase_wS4.changingvector;
%     TestCase_wS4.d = 1;
%     TestCase_wS4.n = 3;
% 
%     TestCase_wS4.RavenLimits_yrot = pi/4;
%     TestCase_wS4.RavenLimits_xrot = pi/4;
%     TestCase_wS4.RavenLimits_tranmin = 0;
%     TestCase_wS4.RavenLimits_tranmax = 80;
%     TestCase_wS4.changingvar = 'w'; 
%     %
%     TestCase_wS4.anatomies = {'VoxelData_SBSE20_10mmw1_.mat';
%                              'VoxelData_SBSE20_10mmw2_.mat';
%                              'VoxelData_SBSE20_10mmw3_.mat';
%                              'VoxelData_SBSE20_10mmw4_.mat';
%                              'VoxelData_SBSE20_10mmw5_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_wS4.environment = environment;
%     TestCase_wS4.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_wS4.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : w S5, Widths 8mm-environment SE10
% for foldcase = 1
%     % Change the following to suit test case:
% 
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'wS5_SB'; % square box
% 
%     samplesize = '5e8_w0d1n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_wS5.N = choose_samplesize; 
% 
%     TestCase_wS5.changingvector = 1:1:5;
% 
%     TestCase_wS5.alpha = deg2rad(90);
%     TestCase_wS5.w = TestCase_wS5.changingvector;
%     TestCase_wS5.d = 1;
%     TestCase_wS5.n = 3;
% 
%     TestCase_wS5.RavenLimits_yrot = pi/4;
%     TestCase_wS5.RavenLimits_xrot = pi/4;
%     TestCase_wS5.RavenLimits_tranmin = 0;
%     TestCase_wS5.RavenLimits_tranmax = 80;
%     TestCase_wS5.changingvar = 'w'; 
%     %
%     TestCase_wS5.anatomies = {'VoxelData_SBSE10_8mmw1_.mat';
%                               'VoxelData_SBSE10_8mmw2_.mat';
%                               'VoxelData_SBSE10_8mmw3_.mat';
%                               'VoxelData_SBSE10_8mmw4_.mat';
%                               'VoxelData_SBSE10_8mmw5_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_wS5.environment = environment;
%     TestCase_wS5.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_wS5.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : w S6, Widths 8mm-environment SE20
% for foldcase = 1
%     % Change the following to suit test case:
% 
%     RV = 'F'; % Translational & Rotational
%     target = 'SE20'; % Direct Extruded T == TARGET
%     environment = 'wS6_SB'; % square box
% 
%     samplesize = '5e8_w0d1n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_wS6.N = choose_samplesize; 
% 
%     TestCase_wS6.changingvector = 1:1:5;
% 
%     TestCase_wS6.alpha = deg2rad(90);
%     TestCase_wS6.w = TestCase_wS6.changingvector;
%     TestCase_wS6.d = 1;
%     TestCase_wS6.n = 3;
% 
%     TestCase_wS6.RavenLimits_yrot = pi/4;
%     TestCase_wS6.RavenLimits_xrot = pi/4;
%     TestCase_wS6.RavenLimits_tranmin = 0;
%     TestCase_wS6.RavenLimits_tranmax = 80;
%     TestCase_wS6.changingvar = 'w'; 
%     %
%     TestCase_wS6.anatomies = {'VoxelData_SBSE20_8mmw1_.mat';
%                               'VoxelData_SBSE20_8mmw2_.mat';
%                               'VoxelData_SBSE20_8mmw3_.mat';
%                               'VoxelData_SBSE20_8mmw4_.mat';
%                               'VoxelData_SBSE20_8mmw5_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_wS6.environment = environment;
%     TestCase_wS6.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_wS6.descript = ['RV: ', RV, '   Target: ', target];
% end

% %% TEST CASE : n S1 SE10 %%%%%%%%%%%%%%%%%%%% n = 1:5 only ONLY ONLY ONLY
% for foldcase = 1
%     % Change the following to suit test case:
% 
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'nS1_SB'; % square box
% 
%     samplesize = '5e8_w3d1n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_nS1.N = choose_samplesize;
% 
%     TestCase_nS1.changingvector = 1:1:5;
% 
%     TestCase_nS1.alpha = deg2rad(90);
%     TestCase_nS1.w = 3;
%     TestCase_nS1.d = 1;
%     TestCase_nS1.n = TestCase_nS1.changingvector;
% 
%     TestCase_nS1.RavenLimits_yrot = pi/4;
%     TestCase_nS1.RavenLimits_xrot = pi/4;
%     TestCase_nS1.RavenLimits_tranmin = 0;
%     TestCase_nS1.RavenLimits_tranmax = 80;
%     TestCase_nS1.changingvar = 'n'; 
% 
%     TestCase_nS1.anatomies = {'VoxelData_SBSE10_8mmw3_.mat';
%                              'VoxelData_SBSE10_10mmw3_.mat';
%                              'VoxelData_SBSE10_12mmw3_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_nS1.environment = environment;
%     TestCase_nS1.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_nS1.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : n S2 SE20
% for foldcase = 1
%     % Change the following to suit test case:
% 
%     RV = 'F'; % Translational & Rotational
%     target = 'SE20'; % Direct Extruded T == TARGET
%     environment = 'n2_SB'; % square box
% 
%     samplesize = '5e8_w3d1n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_nS2.N = choose_samplesize;
% 
%     TestCase_nS2.changingvector = 1:1:5;
% 
%     TestCase_nS2.alpha = deg2rad(90);
%     TestCase_nS2.w = 3;
%     TestCase_nS2.d = 1;
%     TestCase_nS2.n = TestCase_nS2.changingvector;
% 
%     TestCase_nS2.RavenLimits_yrot = pi/4;
%     TestCase_nS2.RavenLimits_xrot = pi/4;
%     TestCase_nS2.RavenLimits_tranmin = 0;
%     TestCase_nS2.RavenLimits_tranmax = 80;
%     TestCase_nS2.changingvar = 'n'; 
% 
%     TestCase_nS2.anatomies = {'VoxelData_SBSE20_8mmw3_.mat';
%                               'VoxelData_SBSE20_10mmw3_.mat';
%                               'VoxelData_SBSE20_12mmw3_.mat'};
%     % IDs and Description Strings (Don't touch this)
%     TestCase_nS2.environment = environment;
%     TestCase_nS2.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_nS2.descript = ['RV: ', RV, '   Target: ', target];
% end

% % %% TEST CASE : a S1 
% % for foldcase = 1
% %     % Change the following to suit test case:
% %     RV = 'F'; % Translational & Rotational & Full
% %     target = 'SE10'; % Direct Extruded T == TARGET
% %     environment = 'a_SB'; % Square Box
% % 
% %     samplesize = '5e8_w1d3n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% % 
% %     TestCase_aS1.N = choose_samplesize;
% % 
% %     TestCase_aS1.changingvector = 90;
% % 
% %     TestCase_aS1.alpha = deg2rad(90);
% %     TestCase_aS1.w = 1;
% %     TestCase_aS1.d = 3;
% %     TestCase_aS1.n = 3;
% % 
% %     TestCase_aS1.RavenLimits_yrot = pi/4;
% %     TestCase_aS1.RavenLimits_xrot = pi/4;
% %     TestCase_aS1.RavenLimits_tranmin = 0;
% %     TestCase_aS1.RavenLimits_tranmax = 80;
% %     TestCase_aS1.changingvar = 'alpha'; 
% % 
% %     TestCase_aS1.anatomies = {'VoxelData_SBSE10_8mmw1_.mat';
% %                             'VoxelData_SBSE10_10mmw1_.mat';
% %                             'VoxelData_SBSE10_12mmw1_.mat';
% %                             'VoxelData_SBSE10_14mmw1_.mat';
% %                             'VoxelData_SBSE10_18mmw1_.mat';
% %                             'VoxelData_SBSE10_22mmw1_.mat';
% %                             'VoxelData_SBSE10_26mmw1_.mat'
% %                             'VoxelData_SBSE10_30mmw1_.mat'};
% % 
% %     % IDs and Description Strings (Don't touch this)
% %     TestCase_aS1.environment = environment;
% %     TestCase_aS1.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
% %     TestCase_aS1.descript = ['RV: ', RV, '   Target: ', target];
% % end
% % 
% % %% TEST CASE : a S2 
% % for foldcase = 1
% %     % Change the following to suit test case:
% %     RV = 'F'; % Translational & Rotational & Full
% %     target = 'SE10'; % Direct Extruded T == TARGET
% %     environment = 'a_SB'; % Square Box
% % 
% %     samplesize = '5e8_w3d3n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% % 
% %     TestCase_aS2.N = choose_samplesize;
% % 
% %     TestCase_aS2.changingvector = 90;
% % 
% %     TestCase_aS2.alpha = deg2rad(90);
% %     TestCase_aS2.w = 3;
% %     TestCase_aS2.d = 3;
% %     TestCase_aS2.n = 3;
% % 
% %     TestCase_aS2.RavenLimits_yrot = pi/4;
% %     TestCase_aS2.RavenLimits_xrot = pi/4;
% %     TestCase_aS2.RavenLimits_tranmin = 0;
% %     TestCase_aS2.RavenLimits_tranmax = 80;
% %     TestCase_aS2.changingvar = 'alpha'; 
% % 
% %     TestCase_aS2.anatomies = {'VoxelData_SBSE10_8mmw3_.mat';
% %                              'VoxelData_SBSE10_10mmw3_.mat';
% %                              'VoxelData_SBSE10_12mmw3_.mat';
% %                              'VoxelData_SBSE10_14mmw3_.mat';
% %                              'VoxelData_SBSE10_18mmw3_.mat';
% %                              'VoxelData_SBSE10_22mmw3_.mat';
% %                              'VoxelData_SBSE10_26mmw3_.mat'
% %                             ' VoxelData_SBSE10_30mmw3_.mat'};
% % 
% %     % IDs and Description Strings (Don't touch this)
% %     TestCase_aS2.environment = environment;
% %     TestCase_aS2.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
% %     TestCase_aS2.descript = ['RV: ', RV, '   Target: ', target];
% % end
% % 
% % %% TEST CASE : d S1 
% % for foldcase = 1
% %     % Change the following to suit test case:
% %     RV = 'F'; % Translational & Rotational & Full
% %     target = 'SE10'; % Direct Extruded T == TARGET
% %     environment = 'd_SB'; % Square Box
% % 
% %     samplesize = '5e8_w3d0n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% % 
% %     TestCase_dS1.N = choose_samplesize;
% % 
% %     TestCase_dS1.changingvector = 1:1:10;
% % 
% %     TestCase_dS1.alpha = deg2rad(90);
% %     TestCase_dS1.w = 3;
% %     TestCase_dS1.d = TestCase_dS1.changingvector;
% %     TestCase_dS1.n = 3;
% % 
% %     TestCase_dS1.RavenLimits_yrot = pi/4;
% %     TestCase_dS1.RavenLimits_xrot = pi/4;
% %     TestCase_dS1.RavenLimits_tranmin = 0;
% %     TestCase_dS1.RavenLimits_tranmax = 80;
% %     TestCase_dS1.changingvar = 'd'; 
% % 
% %     TestCase_dS1.anatomies = {'VoxelData_SBSE10_8mmw3_.mat';
% %                              'VoxelData_SBSE10_10mmw3_.mat';
% %                              'VoxelData_SBSE10_12mmw3_.mat'};
% % 
% %     % IDs and Description Strings (Don't touch this)
% %     TestCase_dS1.environment = environment;
% %     TestCase_dS1.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
% %     TestCase_dS1.descript = ['RV: ', RV, '   Target: ', target];
% % end



%% Dump froom HPC scripts 
%% Script 1
% %% CASES TO BE RUN 
% Cases = [TestCase_nd4, ...
%     TestCase_wd1, TestCase_wd2, TestCase_wd3, ...
%     TestCase_wn1, TestCase_wn2, TestCase_wn3]; 
% 
% %%TestCase_a1, TestCase_a2,...
% %%   TestCase_d1, ...TestCase_w1, TestCase_w2, ... TestCase_n1, TestCase_nd1,  
% %% Test Cases
% %% TEST CASE : a 1 
% for foldcase = 1
%     % Change the following to suit test case:
%     RV = 'F'; % Translational & Rotational & Full
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'a_SB'; % Square Box
% 
%     samplesize = '5e8_w1d3n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_a1.N = choose_samplesize;
% 
%     TestCase_a1.changingvector = 90;
% 
%     TestCase_a1.alpha = deg2rad(90);
%     TestCase_a1.w = 1;
%     TestCase_a1.d = 3;
%     TestCase_a1.n = 3;
% 
%     TestCase_a1.RavenLimits_yrot = pi/4;
%     TestCase_a1.RavenLimits_xrot = pi/4;
%     TestCase_a1.RavenLimits_tranmin = 0;
%     TestCase_a1.RavenLimits_tranmax = 80;
%     TestCase_a1.changingvar = 'alpha'; 
% 
%     TestCase_a1.anatomies = {'VoxelData_SBSE10_14mmw1_.mat';
%                             'VoxelData_SBSE10_18mmw1_.mat';
%                             'VoxelData_SBSE10_22mmw1_.mat';
%                             'VoxelData_SBSE10_26mmw1_.mat'
%                             'VoxelData_SBSE10_30mmw1_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_a1.environment = environment;
%     TestCase_a1.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_a1.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : a 2 
% for foldcase = 1
%     % Change the following to suit test case:
%     RV = 'F'; % Translational & Rotational & Full
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'a_SB'; % Square Box
% 
%     samplesize = '5e8_w3d3n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_a2.N = choose_samplesize;
% 
%     TestCase_a2.changingvector = 90;
% 
%     TestCase_a2.alpha = deg2rad(90);
%     TestCase_a2.w = 3;
%     TestCase_a2.d = 3;
%     TestCase_a2.n = 3;
% 
%     TestCase_a2.RavenLimits_yrot = pi/4;
%     TestCase_a2.RavenLimits_xrot = pi/4;
%     TestCase_a2.RavenLimits_tranmin = 0;
%     TestCase_a2.RavenLimits_tranmax = 80;
%     TestCase_a2.changingvar = 'alpha'; 
% 
%     TestCase_a2.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
%                             'VoxelData_SBSE10_18mmw3_.mat';
%                             'VoxelData_SBSE10_22mmw3_.mat';
%                             'VoxelData_SBSE10_26mmw3_.mat'
%                             'VoxelData_SBSE10_30mmw3_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_a2.environment = environment;
%     TestCase_a2.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_a2.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : d 1 
% for foldcase = 1
%     % Change the following to suit test case:
%     RV = 'F'; % Translational & Rotational & Full
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'd1_SB'; % Square Box
% 
%     samplesize = '5e8_w3d0n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_d1.N = choose_samplesize;
% 
%     TestCase_d1.changingvector = 1:1:10;
% 
%     TestCase_d1.alpha = deg2rad(90);
%     TestCase_d1.w = 3;
%     TestCase_d1.d = TestCase_d1.changingvector;
%     TestCase_d1.n = 3;
% 
%     TestCase_d1.RavenLimits_yrot = pi/4;
%     TestCase_d1.RavenLimits_xrot = pi/4;
%     TestCase_d1.RavenLimits_tranmin = 0;
%     TestCase_d1.RavenLimits_tranmax = 80;
%     TestCase_d1.changingvar = 'd'; 
% 
%     TestCase_d1.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
%                              'VoxelData_SBSE10_22mmw3_.mat';
%                              'VoxelData_SBSE10_26mmw3_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_d1.environment = environment;
%     TestCase_d1.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_d1.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : w 1, Widths 14mm-environmen
% for foldcase = 1
%     % Change the following to suit test case:
% 
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'w1_SB'; % square box
% 
%     samplesize = '5e8_w0d1n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_w1.N = choose_samplesize; 
% 
%     TestCase_w1.changingvector = 1:1:5;
% 
%     TestCase_w1.alpha = deg2rad(90);
%     TestCase_w1.w = TestCase_w1.changingvector;
%     TestCase_w1.d = 1;
%     TestCase_w1.n = 3;
% 
%     TestCase_w1.RavenLimits_yrot = pi/4;
%     TestCase_w1.RavenLimits_xrot = pi/4;
%     TestCase_w1.RavenLimits_tranmin = 0;
%     TestCase_w1.RavenLimits_tranmax = 80;
%     TestCase_w1.changingvar = 'w'; 
%     %
%     TestCase_w1.anatomies = {'VoxelData_SBSE10_14mmw1_.mat';
%                              'VoxelData_SBSE10_14mmw2_.mat';
%                              'VoxelData_SBSE10_14mmw3_.mat';
%                              'VoxelData_SBSE10_14mmw4_.mat';
%                              'VoxelData_SBSE10_14mmw5_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_w1.environment = environment;
%     TestCase_w1.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_w1.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : w 2, Widths 26mm-environmen
% for foldcase = 1
%     % Change the following to suit test case:
% 
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'w2_SB'; % square box
% 
%     samplesize = '5e8_w0d1n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_w2.N = choose_samplesize; 
% 
%     TestCase_w2.changingvector = 1:1:5;
% 
%     TestCase_w2.alpha = deg2rad(90);
%     TestCase_w2.w = TestCase_w2.changingvector;
%     TestCase_w2.d = 1;
%     TestCase_w2.n = 3;
% 
%     TestCase_w2.RavenLimits_yrot = pi/4;
%     TestCase_w2.RavenLimits_xrot = pi/4;
%     TestCase_w2.RavenLimits_tranmin = 0;
%     TestCase_w2.RavenLimits_tranmax = 80;
%     TestCase_w2.changingvar = 'w'; 
% 
%     TestCase_w2.anatomies = {'VoxelData_SBSE10_26mmw1_.mat';
%                              'VoxelData_SBSE10_26mmw2_.mat';
%                              'VoxelData_SBSE10_26mmw3_.mat';
%                              'VoxelData_SBSE10_26mmw4_.mat';
%                              'VoxelData_SBSE10_26mmw5_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_w2.environment = environment;
%     TestCase_w2.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_w2.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : n 1 
% for foldcase = 1
%     % Change the following to suit test case:
% 
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'n1_SB'; % square box
% 
%     samplesize = '5e8_w3d1n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_n1.N = choose_samplesize;
% 
%     TestCase_n1.changingvector = 1:1:10;
% 
%     TestCase_n1.alpha = deg2rad(90);
%     TestCase_n1.w = 3;
%     TestCase_n1.d = 1;
%     TestCase_n1.n = TestCase_n1.changingvector;
% 
%     TestCase_n1.RavenLimits_yrot = pi/4;
%     TestCase_n1.RavenLimits_xrot = pi/4;
%     TestCase_n1.RavenLimits_tranmin = 0;
%     TestCase_n1.RavenLimits_tranmax = 80;
%     TestCase_n1.changingvar = 'n'; 
% 
%     TestCase_n1.anatomies =  {'VoxelData_SBSE10_14mmw3_.mat';
% 				'VoxelData_SBSE10_18mmw3_.mat';
%                               'VoxelData_SBSE10_22mmw3_.mat';
%                               'VoxelData_SBSE10_26mmw3_.mat';
% 				'VoxelData_SBSE10_30mmw3_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_n1.environment = environment;
%     TestCase_n1.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_n1.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : wd 1 
% for foldcase = 1
%     % Change the following to suit test case:
% 
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'wd1_SB'; % square box
% 
%     samplesize = '5e8_w1d0n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_wd1.N = choose_samplesize;
% 
%     TestCase_wd1.changingvector = 1:1:10;
% 
%     TestCase_wd1.alpha = deg2rad(90);
%     TestCase_wd1.w = 1;
%     TestCase_wd1.d = TestCase_wd1.changingvector;
%     TestCase_wd1.n = 3;
% 
%     TestCase_wd1.RavenLimits_yrot = pi/4;
%     TestCase_wd1.RavenLimits_xrot = pi/4;
%     TestCase_wd1.RavenLimits_tranmin = 0;
%     TestCase_wd1.RavenLimits_tranmax = 80;
%     TestCase_wd1.changingvar = 'd'; 
% 
%     TestCase_wd1.anatomies = {'VoxelData_SBSE10_14mmw1_.mat';
% 			      'VoxelData_SBSE10_18mmw1_.mat';
%                               'VoxelData_SBSE10_22mmw1_.mat';
%                               'VoxelData_SBSE10_26mmw1_.mat';
% 		       	      'VoxelData_SBSE10_30mmw1_.mat';};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_wd1.environment = environment;
%     TestCase_wd1.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_wd1.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : wd 2 
% for foldcase = 1
%     % Change the following to suit test case:
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'wd2_SB'; % square box
% 
%     samplesize = '5e8_w2d0n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_wd2.N = choose_samplesize;
% 
%     TestCase_wd2.changingvector = 1:1:10;
% 
%     TestCase_wd2.alpha = deg2rad(90);
%     TestCase_wd2.w = 2;
%     TestCase_wd2.d = TestCase_wd2.changingvector;
%     TestCase_wd2.n = 3;
% 
%     TestCase_wd2.RavenLimits_yrot = pi/4;
%     TestCase_wd2.RavenLimits_xrot = pi/4;
%     TestCase_wd2.RavenLimits_tranmin = 0;
%     TestCase_wd2.RavenLimits_tranmax = 80;
%     TestCase_wd2.changingvar = 'd'; 
% 
%     TestCase_wd2.anatomies = {'VoxelData_SBSE10_14mmw2_.mat';
% 			      'VoxelData_SBSE10_18mmw2_.mat';
%                               'VoxelData_SBSE10_22mmw2_.mat';
%                               'VoxelData_SBSE10_26mmw2_.mat';
% 			      'VoxelData_SBSE10_30mmw2_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_wd2.environment = environment;
%     TestCase_wd2.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_wd2.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : wd 3 
% for foldcase = 1
%     % Change the following to suit test case:
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'wd3_SB'; % square box
% 
%     samplesize = '5e8_w3d0n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_wd3.N = choose_samplesize;
% 
%     TestCase_wd3.changingvector = 1:1:10;
% 
%     TestCase_wd3.alpha = deg2rad(90);
%     TestCase_wd3.w = 3;
%     TestCase_wd3.d = TestCase_wd3.changingvector;
%     TestCase_wd3.n = 3;
% 
%     TestCase_wd3.RavenLimits_yrot = pi/4;
%     TestCase_wd3.RavenLimits_xrot = pi/4;
%     TestCase_wd3.RavenLimits_tranmin = 0;
%     TestCase_wd3.RavenLimits_tranmax = 80;
%     TestCase_wd3.changingvar = 'd'; 
% 
%     TestCase_wd3.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
% 				'VoxelData_SBSE10_18mmw3_.mat';
%                               'VoxelData_SBSE10_22mmw3_.mat';
%                               'VoxelData_SBSE10_26mmw3_.mat';
% 				'VoxelData_SBSE10_30mmw3_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_wd3.environment = environment;
%     TestCase_wd3.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_wd3.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : wn 1 
% for foldcase = 1
%     % Change the following to suit test case:
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'wn1_SB'; % square box
% 
%     samplesize = '5e8_w1d1n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_wn1.N = choose_samplesize;
% 
%     TestCase_wn1.changingvector = 1:1:10;
% 
%     TestCase_wn1.alpha = deg2rad(90);
%     TestCase_wn1.w = 1;
%     TestCase_wn1.d = 1;
%     TestCase_wn1.n = TestCase_wn1.changingvector;
% 
%     TestCase_wn1.RavenLimits_yrot = pi/4;
%     TestCase_wn1.RavenLimits_xrot = pi/4;
%     TestCase_wn1.RavenLimits_tranmin = 0;
%     TestCase_wn1.RavenLimits_tranmax = 80;
%     TestCase_wn1.changingvar = 'n'; 
% 
%     TestCase_wn1.anatomies = {'VoxelData_SBSE10_14mmw1_.mat';
% 			      'VoxelData_SBSE10_18mmw1_.mat';
%                               'VoxelData_SBSE10_22mmw1_.mat';
%                               'VoxelData_SBSE10_26mmw1_.mat';
% 			      'VoxelData_SBSE10_30mmw1_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_wn1.environment = environment;
%     TestCase_wn1.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_wn1.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : wn 2 
% for foldcase = 1
%     % Change the following to suit test case:
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'wn2_SB'; % square box
% 
%     samplesize = '5e8_w2d1n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_wn2.N = choose_samplesize;
% 
%     TestCase_wn2.changingvector = 1:1:10;
% 
%     TestCase_wn2.alpha = deg2rad(90);
%     TestCase_wn2.w = 2;
%     TestCase_wn2.d = 1;
%     TestCase_wn2.n = TestCase_wn2.changingvector;
% 
%     TestCase_wn2.RavenLimits_yrot = pi/4;
%     TestCase_wn2.RavenLimits_xrot = pi/4;
%     TestCase_wn2.RavenLimits_tranmin = 0;
%     TestCase_wn2.RavenLimits_tranmax = 80;
%     TestCase_wn2.changingvar = 'n'; 
% 
%     TestCase_wn2.anatomies = {'VoxelData_SBSE10_14mmw2_.mat';
% 			      'VoxelData_SBSE10_18mmw2_.mat';
%                               'VoxelData_SBSE10_22mmw2_.mat';
%                               'VoxelData_SBSE10_26mmw2_.mat';
% 			      'VoxelData_SBSE10_30mmw2_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_wn2.environment = environment;
%     TestCase_wn2.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_wn2.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : wn 3 
% for foldcase = 1
% 
%     % Change the following to suit test case:
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'wn3_SB'; % square box
% 
%     samplesize = '5e8_w3d1n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_wn3.N = choose_samplesize;
% 
%     TestCase_wn3.changingvector = 1:1:10;
% 
%     TestCase_wn3.alpha = deg2rad(90);
%     TestCase_wn3.w = 3;
%     TestCase_wn3.d = 1;
%     TestCase_wn3.n = TestCase_wn3.changingvector;
% 
%     TestCase_wn3.RavenLimits_yrot = pi/4;
%     TestCase_wn3.RavenLimits_xrot = pi/4;
%     TestCase_wn3.RavenLimits_tranmin = 0;
%     TestCase_wn3.RavenLimits_tranmax = 80;
%     TestCase_wn3.changingvar = 'n'; 
% 
%     TestCase_wn3.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
% 			      'VoxelData_SBSE10_18mmw3_.mat';
%                               'VoxelData_SBSE10_22mmw3_.mat';
%                               'VoxelData_SBSE10_26mmw3_.mat';
%                               'VoxelData_SBSE10_30mmw3_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_wn3.environment = environment;
%     TestCase_wn3.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_wn3.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : nd 1 (d = 1)
% for foldcase = 1
% 
%     % Change the following to suit test case:
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'nd1_SB'; % square box
% 
%     samplesize = '5e8_w3d1n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_nd1.N = choose_samplesize;
% 
%     TestCase_nd1.changingvector = 1:1:10;
% 
%     TestCase_nd1.alpha = deg2rad(90);
%     TestCase_nd1.w = 3;
%     TestCase_nd1.d = 1;
%     TestCase_nd1.n = TestCase_nd1.changingvector;
% 
%     TestCase_nd1.RavenLimits_yrot = pi/4;
%     TestCase_nd1.RavenLimits_xrot = pi/4;
%     TestCase_nd1.RavenLimits_tranmin = 0;
%     TestCase_nd1.RavenLimits_tranmax = 80;
%     TestCase_nd1.changingvar = 'n'; 
% 
%     TestCase_nd1.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
% 			      'VoxelData_SBSE10_18mmw3_.mat';
%                               'VoxelData_SBSE10_22mmw3_.mat';
%                               'VoxelData_SBSE10_26mmw3_.mat';
%                               'VoxelData_SBSE10_30mmw3_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_nd1.environment = environment;
%     TestCase_nd1.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_nd1.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : nd 2 (d = 2)
% for foldcase = 1
% 
%     % Change the following to suit test case:
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'nd2_SB'; % square box
% 
%     samplesize = '5e8_w3d2n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_nd2.N = choose_samplesize;
% 
%     TestCase_nd2.changingvector = 1:1:10;
% 
%     TestCase_nd2.alpha = deg2rad(90);
%     TestCase_nd2.w = 3;
%     TestCase_nd2.d = 2;
%     TestCase_nd2.n = TestCase_nd2.changingvector;
% 
%     TestCase_nd2.RavenLimits_yrot = pi/4;
%     TestCase_nd2.RavenLimits_xrot = pi/4;
%     TestCase_nd2.RavenLimits_tranmin = 0;
%     TestCase_nd2.RavenLimits_tranmax = 80;
%     TestCase_nd2.changingvar = 'n'; 
% 
%     TestCase_nd2.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
% 			      'VoxelData_SBSE10_18mmw3_.mat';
%                               'VoxelData_SBSE10_22mmw3_.mat';
%                               'VoxelData_SBSE10_26mmw3_.mat';
%                               'VoxelData_SBSE10_30mmw3_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_nd2.environment = environment;
%     TestCase_nd2.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_nd2.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : nd 3 (d = 3)
% for foldcase = 1
% 
%     % Change the following to suit test case:
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'nd3_SB'; % square box
% 
%     samplesize = '5e8_w3d3n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_nd3.N = choose_samplesize;
% 
%     TestCase_nd3.changingvector = 1:1:10;
% 
%     TestCase_nd3.alpha = deg2rad(90);
%     TestCase_nd3.w = 3;
%     TestCase_nd3.d = 3;
%     TestCase_nd3.n = TestCase_nd3.changingvector;
% 
%     TestCase_nd3.RavenLimits_yrot = pi/4;
%     TestCase_nd3.RavenLimits_xrot = pi/4;
%     TestCase_nd3.RavenLimits_tranmin = 0;
%     TestCase_nd3.RavenLimits_tranmax = 80;
%     TestCase_nd3.changingvar = 'n'; 
% 
%     TestCase_nd3.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
% 			      'VoxelData_SBSE10_18mmw3_.mat';
%                               'VoxelData_SBSE10_22mmw3_.mat';
%                               'VoxelData_SBSE10_26mmw3_.mat';
%                               'VoxelData_SBSE10_30mmw3_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_nd3.environment = environment;
%     TestCase_nd3.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_nd3.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : nd 4 (d = 5)
% for foldcase = 1
% 
%     % Change the following to suit test case:
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'nd4_SB'; % square box
% 
%     samplesize = '5e8_w3d5n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_nd4.N = choose_samplesize;
% 
%     TestCase_nd4.changingvector = 1:1:10;
% 
%     TestCase_nd4.alpha = deg2rad(90);
%     TestCase_nd4.w = 3;
%     TestCase_nd4.d = 5;
%     TestCase_nd4.n = TestCase_nd4.changingvector;
% 
%     TestCase_nd4.RavenLimits_yrot = pi/4;
%     TestCase_nd4.RavenLimits_xrot = pi/4;
%     TestCase_nd4.RavenLimits_tranmin = 0;
%     TestCase_nd4.RavenLimits_tranmax = 80;
%     TestCase_nd4.changingvar = 'n'; 
% 
%     TestCase_nd4.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
% 			      'VoxelData_SBSE10_18mmw3_.mat';
%                               'VoxelData_SBSE10_22mmw3_.mat';
%                               'VoxelData_SBSE10_26mmw3_.mat';
%                               'VoxelData_SBSE10_30mmw3_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_nd4.environment = environment;
%     TestCase_nd4.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_nd4.descript = ['RV: ', RV, '   Target: ', target];
% end


%% Script 2

% %% TEST CASE : wd 1 
% for foldcase = 1
%     % Change the following to suit test case:
% 
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'wd_SB'; % square box
% 
%     samplesize = '5e8_w1d0n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_wd1.N = choose_samplesize;
% 
%     TestCase_wd1.changingvector = 1:1:10;
% 
%     TestCase_wd1.alpha = deg2rad(90);
%     TestCase_wd1.w = 1;
%     TestCase_wd1.d = TestCase_wd1.changingvector;
%     TestCase_wd1.n = 3;
% 
%     TestCase_wd1.RavenLimits_yrot = pi/4;
%     TestCase_wd1.RavenLimits_xrot = pi/4;
%     TestCase_wd1.RavenLimits_tranmin = 0;
%     TestCase_wd1.RavenLimits_tranmax = 80;
%     TestCase_wd1.changingvar = 'd'; 
% 
%     TestCase_wd1.anatomies = {'VoxelData_SBSE10_14mmw1_.mat';
%                               'VoxelData_SBSE10_18mmw1_.mat';
%                               'VoxelData_SBSE10_22mmw1_.mat';
%                               'VoxelData_SBSE10_26mmw1_.mat';
%                               'VoxelData_SBSE10_30mmw1_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_wd1.environment = environment;
%     TestCase_wd1.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_wd1.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : wd 2 
% for foldcase = 1
%     % Change the following to suit test case:
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'wd_SB'; % square box
% 
%     samplesize = '5e8_w2d0n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_wd2.N = choose_samplesize;
% 
%     TestCase_wd2.changingvector = 1:1:10;
% 
%     TestCase_wd2.alpha = deg2rad(90);
%     TestCase_wd2.w = 2;
%     TestCase_wd2.d = TestCase_wd2.changingvector;
%     TestCase_wd2.n = 3;
% 
%     TestCase_wd2.RavenLimits_yrot = pi/4;
%     TestCase_wd2.RavenLimits_xrot = pi/4;
%     TestCase_wd2.RavenLimits_tranmin = 0;
%     TestCase_wd2.RavenLimits_tranmax = 80;
%     TestCase_wd2.changingvar = 'd'; 
% 
%     TestCase_wd2.anatomies = {'VoxelData_SBSE10_14mmw2_.mat';
%                               'VoxelData_SBSE10_18mmw2_.mat';
%                               'VoxelData_SBSE10_22mmw2_.mat';
%                               'VoxelData_SBSE10_26mmw2_.mat';
%                               'VoxelData_SBSE10_30mmw2_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_wd2.environment = environment;
%     TestCase_wd2.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_wd2.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : wd 3 
% for foldcase = 1
%     % Change the following to suit test case:
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'wd_SB'; % square box
% 
%     samplesize = '5e8_w3d0n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_wd3.N = choose_samplesize;
% 
%     TestCase_wd3.changingvector = 1:1:10;
% 
%     TestCase_wd3.alpha = deg2rad(90);
%     TestCase_wd3.w = 3;
%     TestCase_wd3.d = TestCase_wd3.changingvector;
%     TestCase_wd3.n = 3;
% 
%     TestCase_wd3.RavenLimits_yrot = pi/4;
%     TestCase_wd3.RavenLimits_xrot = pi/4;
%     TestCase_wd3.RavenLimits_tranmin = 0;
%     TestCase_wd3.RavenLimits_tranmax = 80;
%     TestCase_wd3.changingvar = 'd'; 
% 
%     TestCase_wd3.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
%                               'VoxelData_SBSE10_18mmw3_.mat';
%                               'VoxelData_SBSE10_22mmw3_.mat';
%                               'VoxelData_SBSE10_26mmw3_.mat';
%                               'VoxelData_SBSE10_30mmw3_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_wd3.environment = environment;
%     TestCase_wd3.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_wd3.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : wn 1 
% for foldcase = 1
%     % Change the following to suit test case:
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'wn_SB'; % square box
% 
%     samplesize = '5e8_w1d1n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_wn1.N = choose_samplesize;
% 
%     TestCase_wn1.changingvector = 1:1:10;
% 
%     TestCase_wn1.alpha = deg2rad(90);
%     TestCase_wn1.w = 1;
%     TestCase_wn1.d = 1;
%     TestCase_wn1.n = TestCase_wn1.changingvector;
% 
%     TestCase_wn1.RavenLimits_yrot = pi/4;
%     TestCase_wn1.RavenLimits_xrot = pi/4;
%     TestCase_wn1.RavenLimits_tranmin = 0;
%     TestCase_wn1.RavenLimits_tranmax = 80;
%     TestCase_wn1.changingvar = 'n'; 
% 
%     TestCase_wn1.anatomies = {'VoxelData_SBSE10_14mmw1_.mat';
%                               'VoxelData_SBSE10_18mmw1_.mat';
%                               'VoxelData_SBSE10_22mmw1_.mat';
%                               'VoxelData_SBSE10_26mmw1_.mat';
%                               'VoxelData_SBSE10_30mmw1_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_wn1.environment = environment;
%     TestCase_wn1.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_wn1.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : wn 2 
% for foldcase = 1
%     % Change the following to suit test case:
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'wn_SB'; % square box
% 
%     samplesize = '5e8_w2d1n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_wn2.N = choose_samplesize;
% 
%     TestCase_wn2.changingvector = 1:1:10;
% 
%     TestCase_wn2.alpha = deg2rad(90);
%     TestCase_wn2.w = 2;
%     TestCase_wn2.d = 1;
%     TestCase_wn2.n = TestCase_wn2.changingvector;
% 
%     TestCase_wn2.RavenLimits_yrot = pi/4;
%     TestCase_wn2.RavenLimits_xrot = pi/4;
%     TestCase_wn2.RavenLimits_tranmin = 0;
%     TestCase_wn2.RavenLimits_tranmax = 80;
%     TestCase_wn2.changingvar = 'n'; 
% 
%     TestCase_wn2.anatomies = {'VoxelData_SBSE10_14mmw2_.mat';
%                               'VoxelData_SBSE10_18mmw2_.mat';
%                               'VoxelData_SBSE10_22mmw2_.mat';
%                               'VoxelData_SBSE10_26mmw2_.mat';
%                               'VoxelData_SBSE10_30mmw2_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_wn2.environment = environment;
%     TestCase_wn2.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_wn2.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : wn 3 
% for foldcase = 1
% 
%     % Change the following to suit test case:
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'wn_SB'; % square box
% 
%     samplesize = '5e8_w3d1n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_wn3.N = choose_samplesize;
% 
%     TestCase_wn3.changingvector = 1:1:10;
% 
%     TestCase_wn3.alpha = deg2rad(90);
%     TestCase_wn3.w = 3;
%     TestCase_wn3.d = 1;
%     TestCase_wn3.n = TestCase_wn3.changingvector;
% 
%     TestCase_wn3.RavenLimits_yrot = pi/4;
%     TestCase_wn3.RavenLimits_xrot = pi/4;
%     TestCase_wn3.RavenLimits_tranmin = 0;
%     TestCase_wn3.RavenLimits_tranmax = 80;
%     TestCase_wn3.changingvar = 'n'; 
% 
%     TestCase_wn3.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
%                               'VoxelData_SBSE10_18mmw3_.mat';
%                               'VoxelData_SBSE10_22mmw3_.mat';
%                               'VoxelData_SBSE10_26mmw3_.mat';
%                               'VoxelData_SBSE10_30mmw3_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_wn3.environment = environment;
%     TestCase_wn3.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_wn3.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : nd 1 (d = 1)
% for foldcase = 1
% 
%     % Change the following to suit test case:
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'nd_SB'; % square box
% 
%     samplesize = '5e8_w3d1n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_nd1.N = choose_samplesize;
% 
%     TestCase_nd1.changingvector = 1:1:10;
% 
%     TestCase_nd1.alpha = deg2rad(90);
%     TestCase_nd1.w = 3;
%     TestCase_nd1.d = 1;
%     TestCase_nd1.n = TestCase_nd1.changingvector;
% 
%     TestCase_nd1.RavenLimits_yrot = pi/4;
%     TestCase_nd1.RavenLimits_xrot = pi/4;
%     TestCase_nd1.RavenLimits_tranmin = 0;
%     TestCase_nd1.RavenLimits_tranmax = 80;
%     TestCase_nd1.changingvar = 'n'; 
% 
%     TestCase_nd1.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
%                               'VoxelData_SBSE10_18mmw3_.mat';
%                               'VoxelData_SBSE10_22mmw3_.mat';
%                               'VoxelData_SBSE10_26mmw3_.mat';
%                               'VoxelData_SBSE10_30mmw3_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_nd1.environment = environment;
%     TestCase_nd1.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_nd1.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : nd 2 (d = 2)
% for foldcase = 1
% 
%     % Change the following to suit test case:
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'nd_SB'; % square box
% 
%     samplesize = '5e8_w3d2n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_nd2.N = choose_samplesize;
% 
%     TestCase_nd2.changingvector = 1:1:10;
% 
%     TestCase_nd2.alpha = deg2rad(90);
%     TestCase_nd2.w = 3;
%     TestCase_nd2.d = 2;
%     TestCase_nd2.n = TestCase_nd2.changingvector;
% 
%     TestCase_nd2.RavenLimits_yrot = pi/4;
%     TestCase_nd2.RavenLimits_xrot = pi/4;
%     TestCase_nd2.RavenLimits_tranmin = 0;
%     TestCase_nd2.RavenLimits_tranmax = 80;
%     TestCase_nd2.changingvar = 'n'; 
% 
%     TestCase_nd2.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
%                               'VoxelData_SBSE10_18mmw3_.mat';
%                               'VoxelData_SBSE10_22mmw3_.mat';
%                               'VoxelData_SBSE10_26mmw3_.mat';
%                               'VoxelData_SBSE10_30mmw3_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_nd2.environment = environment;
%     TestCase_nd2.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_nd2.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : nd 3 (d = 3)
% for foldcase = 1
% 
%     % Change the following to suit test case:
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'nd_SB'; % square box
% 
%     samplesize = '5e8_w3d3n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_nd3.N = choose_samplesize;
% 
%     TestCase_nd3.changingvector = 1:1:10;
% 
%     TestCase_nd3.alpha = deg2rad(90);
%     TestCase_nd3.w = 3;
%     TestCase_nd3.d = 3;
%     TestCase_nd3.n = TestCase_nd3.changingvector;
% 
%     TestCase_nd3.RavenLimits_yrot = pi/4;
%     TestCase_nd3.RavenLimits_xrot = pi/4;
%     TestCase_nd3.RavenLimits_tranmin = 0;
%     TestCase_nd3.RavenLimits_tranmax = 80;
%     TestCase_nd3.changingvar = 'n'; 
% 
%     TestCase_nd3.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
%                               'VoxelData_SBSE10_18mmw3_.mat';
%                               'VoxelData_SBSE10_22mmw3_.mat';
%                               'VoxelData_SBSE10_26mmw3_.mat';
%                               'VoxelData_SBSE10_30mmw3_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_nd3.environment = environment;
%     TestCase_nd3.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_nd3.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : nd 4 (d = 5)
% for foldcase = 1
% 
%     % Change the following to suit test case:
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'nd_SB'; % square box
% 
%     samplesize = '5e8_w3d5n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_nd4.N = choose_samplesize;
% 
%     TestCase_nd4.changingvector = 1:1:10;
% 
%     TestCase_nd4.alpha = deg2rad(90);
%     TestCase_nd4.w = 3;
%     TestCase_nd4.d = 5;
%     TestCase_nd4.n = TestCase_nd4.changingvector;
% 
%     TestCase_nd4.RavenLimits_yrot = pi/4;
%     TestCase_nd4.RavenLimits_xrot = pi/4;
%     TestCase_nd4.RavenLimits_tranmin = 0;
%     TestCase_nd4.RavenLimits_tranmax = 80;
%     TestCase_nd4.changingvar = 'n'; 
% 
%     TestCase_nd4.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
%                               'VoxelData_SBSE10_18mmw3_.mat';
%                               'VoxelData_SBSE10_22mmw3_.mat';
%                               'VoxelData_SBSE10_26mmw3_.mat';
%                               'VoxelData_SBSE10_30mmw3_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_nd4.environment = environment;
%     TestCase_nd4.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_nd4.descript = ['RV: ', RV, '   Target: ', target];
% end
% 

%% Script 3 

% %% TEST CASE : a 1 
% for foldcase = 1
%     % Change the following to suit test case:
%     RV = 'F'; % Translational & Rotational & Full
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'a1_SB'; % Square Box
% 
%     samplesize = '5e8_45w1d3n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_a1.N = choose_samplesize;
% 
%     TestCase_a1.changingvector = 45;
% 
%     TestCase_a1.alpha = deg2rad(45);
%     TestCase_a1.w = 1;
%     TestCase_a1.d = 3;
%     TestCase_a1.n = 3;
% 
%     TestCase_a1.RavenLimits_yrot = pi/4;
%     TestCase_a1.RavenLimits_xrot = pi/4;
%     TestCase_a1.RavenLimits_tranmin = 0;
%     TestCase_a1.RavenLimits_tranmax = 80;
%     TestCase_a1.changingvar = 'alpha'; 
% 
%     TestCase_a1.anatomies = {'VoxelData_SBSE10_14mmw1_.mat';
%                             'VoxelData_SBSE10_18mmw1_.mat';
%                             'VoxelData_SBSE10_22mmw1_.mat';
%                             'VoxelData_SBSE10_26mmw1_.mat'
%                             'VoxelData_SBSE10_30mmw1_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_a1.environment = environment;
%     TestCase_a1.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_a1.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : a 2 
% for foldcase = 1
%     % Change the following to suit test case:
%     RV = 'F'; % Translational & Rotational & Full
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'a2_SB'; % Square Box
% 
%     samplesize = '5e8_45w3d3n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_a2.N = choose_samplesize;
% 
%     TestCase_a2.changingvector = 45;
% 
%     TestCase_a2.alpha = deg2rad(45);
%     TestCase_a2.w = 3;
%     TestCase_a2.d = 3;
%     TestCase_a2.n = 3;
% 
%     TestCase_a2.RavenLimits_yrot = pi/4;
%     TestCase_a2.RavenLimits_xrot = pi/4;
%     TestCase_a2.RavenLimits_tranmin = 0;
%     TestCase_a2.RavenLimits_tranmax = 80;
%     TestCase_a2.changingvar = 'alpha'; 
% 
%     TestCase_a2.anatomies = {'VoxelData_SBSE10_14mmw3_.mat';
%                             'VoxelData_SBSE10_18mmw3_.mat';
%                             'VoxelData_SBSE10_22mmw3_.mat';
%                             'VoxelData_SBSE10_26mmw3_.mat'
%                             'VoxelData_SBSE10_30mmw3_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_a2.environment = environment;
%     TestCase_a2.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_a2.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : w 3, Widths 18mm-environment SE10
% for foldcase = 1
%     % Change the following to suit test case:
% 
%     RV = 'F'; % Translational & Rotational
%     target = 'SE10'; % Direct Extruded T == TARGET
%     environment = 'w3_SB'; % square box
% 
%     samplesize = '5e8_w0d1n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_w3.N = choose_samplesize; 
% 
%     TestCase_w3.changingvector = 1:1:5;
% 
%     TestCase_w3.alpha = deg2rad(90);
%     TestCase_w3.w = TestCase_w3.changingvector;
%     TestCase_w3.d = 1;
%     TestCase_w3.n = 3;
% 
%     TestCase_w3.RavenLimits_yrot = pi/4;
%     TestCase_w3.RavenLimits_xrot = pi/4;
%     TestCase_w3.RavenLimits_tranmin = 0;
%     TestCase_w3.RavenLimits_tranmax = 80;
%     TestCase_w3.changingvar = 'w'; 
% 
%     TestCase_w3.anatomies = {'VoxelData_SBSE10_18mmw1_.mat';
%                              'VoxelData_SBSE10_18mmw2_.mat';
%                              'VoxelData_SBSE10_18mmw3_.mat';
%                              'VoxelData_SBSE10_18mmw4_.mat';
%                              'VoxelData_SBSE10_18mmw5_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_w3.environment = environment;
%     TestCase_w3.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_w3.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : w 4, Widths 14mm-environment SE20
% for foldcase = 1
%     % Change the following to suit test case:
% 
%     RV = 'F'; % Translational & Rotational
%     target = 'SE20'; % Direct Extruded T == TARGET
%     environment = 'w4_SB'; % square box
% 
%     samplesize = '5e8_w0d1n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_w4.N = choose_samplesize; 
% 
%     TestCase_w4.changingvector = 1:1:5;
% 
%     TestCase_w4.alpha = deg2rad(90);
%     TestCase_w4.w = TestCase_w4.changingvector;
%     TestCase_w4.d = 1;
%     TestCase_w4.n = 3;
% 
%     TestCase_w4.RavenLimits_yrot = pi/4;
%     TestCase_w4.RavenLimits_xrot = pi/4;
%     TestCase_w4.RavenLimits_tranmin = 0;
%     TestCase_w4.RavenLimits_tranmax = 80;
%     TestCase_w4.changingvar = 'w'; 
% 
%     TestCase_w4.anatomies = {'VoxelData_SBSE20_14mmw1_.mat';
%                              'VoxelData_SBSE20_14mmw2_.mat';
%                              'VoxelData_SBSE20_14mmw3_.mat';
%                              'VoxelData_SBSE20_14mmw4_.mat';
%                              'VoxelData_SBSE20_14mmw5_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_w4.environment = environment;
%     TestCase_w4.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_w4.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : w 5, Widths 26mm-environment SE20
% for foldcase = 1
%     % Change the following to suit test case:
% 
%     RV = 'F'; % Translational & Rotational
%     target = 'SE20'; % Direct Extruded T == TARGET
%     environment = 'w5_SB'; % square box
% 
%     samplesize = '5e8_w0d1n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_w5.N = choose_samplesize; 
% 
%     TestCase_w5.changingvector = 1:1:5;
% 
%     TestCase_w5.alpha = deg2rad(90);
%     TestCase_w5.w = TestCase_w5.changingvector;
%     TestCase_w5.d = 1;
%     TestCase_w5.n = 3;
% 
%     TestCase_w5.RavenLimits_yrot = pi/4;
%     TestCase_w5.RavenLimits_xrot = pi/4;
%     TestCase_w5.RavenLimits_tranmin = 0;
%     TestCase_w5.RavenLimits_tranmax = 80;
%     TestCase_w5.changingvar = 'w'; 
% 
%     TestCase_w5.anatomies = {'VoxelData_SBSE20_26mmw1_.mat';
%                              'VoxelData_SBSE20_26mmw2_.mat';
%                              'VoxelData_SBSE20_26mmw3_.mat';
%                              'VoxelData_SBSE20_26mmw4_.mat';
%                              'VoxelData_SBSE20_26mmw5_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_w5.environment = environment;
%     TestCase_w5.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_w5.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% %% TEST CASE : w 6, Widths 18mm-environment SE20
% for foldcase = 1
%     % Change the following to suit test case:
% 
%     RV = 'F'; % Translational & Rotational
%     target = 'SE20'; % Direct Extruded T == TARGET
%     environment = 'w6_SB'; % square box
% 
%     samplesize = '5e8_w0d1n3'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% 
%     TestCase_w6.N = choose_samplesize; 
% 
%     TestCase_w6.changingvector = 1:1:5;
% 
%     TestCase_w6.alpha = deg2rad(90);
%     TestCase_w6.w = TestCase_w6.changingvector;
%     TestCase_w6.d = 1;
%     TestCase_w6.n = 3;
% 
%     TestCase_w6.RavenLimits_yrot = pi/4;
%     TestCase_w6.RavenLimits_xrot = pi/4;
%     TestCase_w6.RavenLimits_tranmin = 0;
%     TestCase_w6.RavenLimits_tranmax = 80;
%     TestCase_w6.changingvar = 'w'; 
% 
%     TestCase_w6.anatomies = {'VoxelData_SBSE20_18mmw1_.mat';
%                              'VoxelData_SBSE20_18mmw2_.mat';
%                              'VoxelData_SBSE20_18mmw3_.mat';
%                              'VoxelData_SBSE20_18mmw4_.mat';
%                              'VoxelData_SBSE20_18mmw5_.mat'};
% 
%     % IDs and Description Strings (Don't touch this)
%     TestCase_w6.environment = environment;
%     TestCase_w6.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
%     TestCase_w6.descript = ['RV: ', RV, '   Target: ', target];
% end
% 
% % % TEST CASE : n 2 SE20
% % for foldcase = 1
% %     Change the following to suit test case:
% % 
% %     RV = 'F'; % Translational & Rotational
% %     target = 'SE20'; % Direct Extruded T == TARGET
% %     environment = 'n2_SB'; % square box
% % 
% %     samplesize = '5e8_w3d1n0'; % INCLUDES PARAM INFO TOO (0 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!
% % 
% %     TestCase_n2.N = choose_samplesize;
% % 
% %     TestCase_n2.changingvector = 1:1:10;
% % 
% %     TestCase_n2.alpha = deg2rad(90);
% %     TestCase_n2.w = 3;
% %     TestCase_n2.d = 1;
% %     TestCase_n2.n = TestCase_n2.changingvector;
% % 
% %     TestCase_n2.RavenLimits_yrot = pi/4;
% %     TestCase_n2.RavenLimits_xrot = pi/4;
% %     TestCase_n2.RavenLimits_tranmin = 0;
% %     TestCase_n2.RavenLimits_tranmax = 80;
% %     TestCase_n2.changingvar = 'n'; 
% % 
% %     TestCase_n2.anatomies = {'VoxelData_SBSE20_14mmw3_.mat';
% %                              'VoxelData_SBSE20_18mmw3_.mat';
% %                              'VoxelData_SBSE20_22mmw3_.mat';
% %                              'VoxelData_SBSE20_26mmw3_.mat';
% %                              'VoxelData_SBSE20_30mmw3_.mat'};
% % 
% %     IDs and Description Strings (Don't touch this)
% %     TestCase_n2.environment = environment;
% %     TestCase_n2.ID = [environment,'_', 'N', samplesize, '_RV', RV, '_T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
% %     TestCase_n2.descript = ['RV: ', RV, '   Target: ', target];
% % end

