% Differential Evolution script
% SnakeRaven Optimisation on HPC
% Andrew Razjigaev 11 Feb 2021

clc;
clear;
close all;

%% Create Directory on HPC-Drive for all the results to go into:
addpath(pwd);
%Create a directory name based on the current time
directory = strcat('surfacetest_',strrep(strrep(datestr(datetime),':','_'),' ','_')); % PARAM RELATIONSHIP RESULTS

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


% Change the following to suit test case:

TestCase_A.N = 10*1e6; %200 000

TestCase_A.alpha = deg2rad(90);
TestCase_A.w = 2;
TestCase_A.d = 1;
TestCase_A.n = 3;


% TestCase_A.anatomies = {'BLOCK_20May2025.mat'};
TestCase_A.anatomies = {'VoxelData_L2L3S_10mmw2_.mat'};

%% TEST CASE B %%
% poolobj = parpool('local',[2 30],'SpmdEnabled',false,'IdleTimeout',60);
% disp(poolobj)

%% MAIN

CurrentCase = TestCase_A; % Cases(casecase);
sample_size = CurrentCase(1).N;% 30 *1e6;%  1.5*1e6;
disp(['Configuration sample size:', num2str(sample_size)])

% % Entrance frame
% Entranceframe = [Ry(deg2rad(-90)) [0 0 30]'; 0 0 0 1];

MaxIt = 1;
alpha = CurrentCase(1).alpha;% 35 deg2rad(5):deg2rad(10)-deg2rad(5):deg2rad(90);
w = CurrentCase(1).w;
d = CurrentCase(1).d; % :1:10;
n = CurrentCase(1).n;

anatomies = CurrentCase(1).anatomies;

%% DE Parameters
nPop = 1;

%% Main Loop

Costs = zeros(nPop,length(anatomies));


% Environment setup
Anatomyfilename = anatomies{1};
disp('Using Anatomy file:')
disp(Anatomyfilename)

%Voxel Map
Voxels = load(Anatomyfilename,'Voxel_data');

% Cost Function
CostFunction=@(design) FastFitnessFunctionVariableSegmentSnakeRobot_SpineSurface_FOR(design,sample_size,Voxels,directory);

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


%% Pre-optimised designs
num_predesigned = 1;
disp('Number of pre-determined designs:')
disp(num_predesigned)
pre_designs = {[1.57, 3, 2.8]}; %[1.37, 4, 1]}; %%, , [1.57, 4, 3], [1.28, 4, 1], [1.29, 4, 1.88]}; % % % [a n d] % % %
predesigned_count = 0;


disp('Begin Evaluation');

for i=1:nPop
    % initial population within bound %unifrnd(VarMin,VarMax,VarSize);
%     pop(i).Position= [alpha(i), n, d]; % generate_random_design(VarMin,VarMax); %% CHANGE CHANGING VAR %%
    if (num_predesigned ~= predesigned_count) %% Use pre-designed design 
        pop(i).Position=generate_random_design(pre_designs{i},pre_designs{i});
        predesigned_count = predesigned_count+1;
    else
        % initial population within bound %unifrnd(VarMin,VarMax,VarSize);
        pop(i).Position=generate_random_design(VarMin,VarMax);
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
        tic
        pop(i).Cost=-1*CostFunction(vector2designstruct(pop(i).Position, w));
        toc
        pop(i).Time = toc;

    end

    disp('Dexterity score for This design was:')
    disp(-1*pop(i).Cost)


    %Record population member and data:
    Allpop{i,1} = pop(i).Position;
    Allcost{i,1} = pop(i).Cost;
    Alltime{i,1} = pop(i).Time;
end

disp('Evaluation has finished...');
BestCost=zeros(MaxIt,1);
disp(' ')






diary off

