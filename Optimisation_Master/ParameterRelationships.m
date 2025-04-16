% Differential Evolution script
% SnakeRaven Optimisation on HPC
% Andrew Razjigaev 11 Feb 2021

clc;
clear;
close all;

%% Create Directory on HPC-Drive for all the results to go into:
addpath(pwd);
%Create a directory name based on the current time
directory = strcat('PRRSS_',strrep(strrep(datestr(datetime),':','_'),' ','_')); % PARAM RELATIONSHIP RESULTS

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

%% TEST CASE A %%

% Change the following to suit test case:

RV = 'T'; % Translational Movement Only
target = 'SE10'; % Direct Extruded T == TARGET
environment = 'SB'; % Cylinder

samplesize = '10e6_w3d3n3'; % INCLUDES PARAM INFO TOO (00 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

TestCase_A.N = 10*1e2;

TestCase_A.alpha = deg2rad(90);
TestCase_A.w = 3;
TestCase_A.d = 3;
TestCase_A.n = 3;

TestCase_A.RavenLimits_yrot = 0; 
TestCase_A.RavenLimits_xrot = 0; 
TestCase_A.RavenLimits_tranmin = 0 ;
TestCase_A.RavenLimits_tranmax = 50; 
TestCase_A.changingvar = 'alpha'; % Doesn't matter yet (Needs to be updated for next test phase)

TestCase_A.anatomies = {'VoxelData_SBSE10_14mm_08Apr2025.mat';
                       'VoxelData_SBSE10_18mm_08Apr2025.mat';
                       'VoxelData_SBSE10_22mm_08Apr2025.mat';
                       'VoxelData_SBSE10_26mm_08Apr2025.mat'};

% IDs and Description Strings (Don't touch this)
TestCase_A.ID = [environment,'_', 'N', samplesize, '_RV_', RV, 'T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
TestCase_A.descript = ['RV: ', RV, '   Target: ', target];

%% TEST CASE B %%

% Change the following to suit test case:

RV = 'TR'; % Translational & Rotational
target = 'SE10'; % Direct Extruded T == TARGET
environment = 'SB'; % Cylinder

samplesize = '10e6_w3d3n3'; % INCLUDES PARAM INFO TOO (00 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

TestCase_B.N = 10*1e2;

TestCase_B.alpha = deg2rad(90);
TestCase_B.w = 3;
TestCase_B.d = 3;
TestCase_B.n = 3;

TestCase_B.RavenLimits_yrot = pi/4;
TestCase_B.RavenLimits_xrot = pi/4;
TestCase_B.RavenLimits_tranmin = 0;
TestCase_B.RavenLimits_tranmax = 50; 
TestCase_B.changingvar = 'alpha'; % Doesn't matter yet (Needs to be updated for next test phase)

TestCase_B.anatomies = {'VoxelData_SBSE10_14mm_08Apr2025.mat';
                       'VoxelData_SBSE10_18mm_08Apr2025.mat';
                       'VoxelData_SBSE10_22mm_08Apr2025.mat';
                       'VoxelData_SBSE10_26mm_08Apr2025.mat'};

% IDs and Description Strings (Don't touch this)
TestCase_B.ID = [environment,'_', 'N', samplesize, '_RV_', RV, 'T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
TestCase_B.descript = ['RV: ', RV, '   Target: ', target];

%% 
Cases = [TestCase_A, TestCase_B];

% %% Set up parallel pool
%
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
    d = CurrentCase(1).d; % :1:10;
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

    directory3 = strcat(directory, '\', directory2);
    %% DE Parameters

    if changingvar == 'n'
        nPop= length(n);
    elseif changingvar == 'd'
        nPop= length(d);
    elseif changingvar == 'w'
        nPop= length(w);
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
        CostFunction=@(design) FastFitnessFunctionVariableSegmentSnakeRobotPARAM(design,sample_size,Voxels,directory3, testsetup);

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
            pop(i).Position= [alpha(i), n, d]; % generate_random_design(VarMin,VarMax); %% CHANGE CHANGING VAR %%

            % Run the Fitness Function
            disp(['Testing member ' num2str(i) ' of generation 0']);
            disp('Evaluating design: ')
            disp(vector2designstruct(pop(i).Position))

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
                pop(i).Cost=-1*CostFunction(vector2designstruct(pop(i).Position));
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
    save([directory3, '/', 'Costs'], 'Costs');

end

diary off

