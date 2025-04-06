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

% Change the following to suit test case:

RV = 'T'; % Translational Movement Only
target = 'DE'; % Direct Extruded T == TARGET
environment = 'Cyl'; % Cylinder

samplesize = '1e3_w3d3n3'; % INCLUDES PARAM INFO TOO (00 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

TestCase1.N = 1000;
TestCase1.alpha = deg2rad(90);
TestCase1.w = 3;
TestCase1.d = 3;
TestCase1.n = 3;

TestCase1.RavenLimits_yrot = 0; 
TestCase1.RavenLimits_xrot = 0; 
TestCase1.RavenLimits_tranmin = 0 ;
TestCase1.RavenLimits_tranmax = ceil(sqrt(50^2+2^2))+1; %dist_limit = 50; %radius_limit = 4; % changes depending on cylinder used % travelallowance = 1;
TestCase1.changingvar = 'alpha'; % Doesn't matter yet (Needs to be updated for next test phase)

TestCase1.anatomies = {'VoxelData_Cyl_12mm_23Mar2025.mat';
                       'VoxelData_Cyl_15mm_23Mar2025.mat';
                       'VoxelData_Cyl_24mm_23Mar2025.mat'};

% IDs and Description Strings (Don't touch this)
TestCase1.ID = [environment,'_', 'N', samplesize, '_RV_', RV, 'T', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
TestCase1.descript = ['RV: ', RV, '   Target: ', target];

%% TEST CASE 2 %%
RV = 'TR';
target = 'S';
environment = 'Cyl';
samplesize = '2e3';
TestCase2.ID = [environment, 'N', samplesize, '_RV_', RV, '_Target_', target, '_'];
TestCase2.descript = ['RV: ', RV, ' Target: ', target];

TestCase2.alpha = deg2rad(5);
TestCase2.w = 3;
TestCase2.d = 3;
TestCase2.n = 3;

TestCase2.N = 2000;
TestCase2.RavenLimits_yrot = pi/4;
TestCase2.RavenLimits_xrot = pi/4;
TestCase2.RavenLimits_tranmin = 30 ;
TestCase2.RavenLimits_tranmax = 60; %dist_limit = 50; %radius_limit = 4; % changes depending on cylinder used % travelallowance = 1;
TestCase2.changingvar = 'alpha';

TestCase2.anatomies = {'VoxelData_Cyl_12mm_23Mar2025.mat';
    'VoxelData_Cyl_15mm_23Mar2025.mat';
    'VoxelData_Cyl_24mm_23Mar2025.mat'};

%% 
Cases = [TestCase1, TestCase2];

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
%End parallel loop delete the pool object
% delete(poolobj)



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
