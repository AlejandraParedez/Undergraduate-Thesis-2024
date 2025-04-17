% Differential Evolution script
% SnakeRaven Optimisation on HPC
% Andrew Razjigaev 11 Feb 2021

clc;
clear;
close all;

%% Create Directory on HPC-Drive for all the results to go into:
addpath(pwd);
%Create a directory name based on the current time
directory = strcat('PRR_',strrep(strrep(datestr(datetime),':','_'),' ','_')); % PARAM RELATIONSHIP RESULTS

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


%% Test Cases

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

%% TEST CASE B %%

% Change the following to suit test case:

RV = 'TR'; % Translational & Rotational
target = 'SE10'; % Direct Extruded T == TARGET
environment = 'SBSE10'; % Cylinder

samplesize = '5e6_w3d1n00'; % INCLUDES PARAM INFO TOO (00 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

TestCase_B.N = 5*1e6;

TestCase_B.changingvector = 1:1:10;

TestCase_B.alpha = deg2rad(90);
TestCase_B.w = 3;
TestCase_B.d = 1;
TestCase_B.n = TestCase_B.changingvector;

TestCase_B.RavenLimits_yrot = pi/4;
TestCase_B.RavenLimits_xrot = pi/4;
TestCase_B.RavenLimits_tranmin = 0;
TestCase_B.RavenLimits_tranmax = 60; 
TestCase_B.changingvar = 'n'; % Doesn't matter yet (Needs to be updated for next test phase)

TestCase_B.anatomies = {'VoxelData_SBSE10_14mm_08Apr2025.mat';
                       'VoxelData_SBSE10_18mm_08Apr2025.mat';
                       'VoxelData_SBSE10_22mm_08Apr2025.mat';
                       'VoxelData_SBSE10_26mm_08Apr2025.mat'};

% IDs and Description Strings (Don't touch this)
TestCase_B.environment = environment;
TestCase_B.ID = [environment,'_', 'N', samplesize, '_RV_', RV, '_T_', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
TestCase_B.descript = ['RV: ', RV, '   Target: ', target];

%% TEST CASE C %%

% Change the following to suit test case:

RV = 'TR'; % Translational & Rotational
target = 'SE10'; % Direct Extruded T == TARGET
environment = 'SBSE10'; % Cylinder

samplesize = '5e7_w00d1n3'; % INCLUDES PARAM INFO TOO (00 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

TestCase_C.N = 5*1e4;

TestCase_C.changingvector = 1:1:5;

TestCase_C.alpha = deg2rad(90);
TestCase_C.w = TestCase_C.changingvector;
TestCase_C.d = 1;
TestCase_C.n = 3; %TestCase_C.changingvector;

TestCase_C.RavenLimits_yrot = pi/4;
TestCase_C.RavenLimits_xrot = pi/4;
TestCase_C.RavenLimits_tranmin = 0;
TestCase_C.RavenLimits_tranmax = 60; 
TestCase_C.changingvar = 'w'; % Doesn't matter yet (Needs to be updated for next test phase)
% 
TestCase_C.anatomies = {'VoxelData_SBSE10_26mmw1_13Apr2025.mat';
                       'VoxelData_SBSE10_26mmw2_13Apr2025.mat';
                       'VoxelData_SBSE10_26mmw3_14Apr2025.mat';
                       'VoxelData_SBSE10_26mmw4_14Apr2025.mat';
                       'VoxelData_SBSE10_26mmw5_14Apr2025.mat'};

% TestCase_C.anatomies = {'VoxelData_SBSE10_14mmw1_13Apr2025.mat';
%                        'VoxelData_SBSE10_14mmw2_13Apr2025.mat';
%                        'VoxelData_SBSE10_14mmw3_13Apr2025.mat';
%                        'VoxelData_SBSE10_14mmw4_13Apr2025.mat';
%                        'VoxelData_SBSE10_14mmw5_13Apr2025.mat'};

% IDs and Description Strings (Don't touch this)
TestCase_C.environment = environment;
TestCase_C.ID = [environment,'_', 'N', samplesize, '_RV_', RV, '_T_', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
TestCase_C.descript = ['RV: ', RV, '   Target: ', target];

%% 
Cases = [TestCase_C]; %TestCase_A, TestCase_B];

%% Set up parallel pool

% poolobj = parpool('local',[2 30],'SpmdEnabled',false,'IdleTimeout',60);
% disp(poolobj)

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
        CostFunction=@(design) FastFitnessFunctionVariableSegmentSnakeRobotPARAMFOR(design,sample_size,Voxels,directory3, testsetup);

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
% delete(poolobj)
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
