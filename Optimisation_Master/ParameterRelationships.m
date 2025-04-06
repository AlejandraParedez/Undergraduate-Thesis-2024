% Differential Evolution script
% SnakeRaven Optimisation on HPC
% Andrew Razjigaev 11 Feb 2021
 
clc;
clear;
close all;

%% Create Directory on HPC-Drive for all the results to go into:
addpath(pwd);
%Create a directory name based on the current time
directory = strcat('ParamRelationshipEval_Results',strrep(strrep(datestr(datetime),':','_'),' ','_'));

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


%% Anatomy Voxelization:
% 
anatomies = {'VoxelData_CylE_22mm_27Mar2025'};
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


sample_size = 5000;% 30 *1e6;%  1.5*1e6;
disp('Configuration sample size:')
disp(sample_size)

% Entrance frame
Entranceframe = [Ry(deg2rad(-90)) [0 0 30]'; 0 0 0 1];

MaxIt = 1;
alpha = deg2rad(5);% 35 deg2rad(5):deg2rad(10)-deg2rad(5):deg2rad(90);
w = 3;
d = 3; % :1:10;
n = 3; 

changingvar = alpha; %% Change i-for-loop accordingly
%%5

dist_limit = 50;
radius_limit = 4; % changes depending on cylinder used
travelallowance = 1;


testsetup.descript = 'RV: T&R, Target: S';
testsetup.ID = 'RV_TR_Target_S';
testsetup.RavenLimits_yrot = 0; %pi/4;
testsetup.RavenLimits_xrot = 0; %pi/4;
testsetup.RavenLimits_tranmin = 30 ; 
testsetup.RavenLimits_tranmax = 60; % ceil(sqrt(dist_limit^2+radius_limit^2)) + travelallowance ; 


disp(testsetup)

%% DE Parameters
nPop= length(changingvar);        % Population Size

%% Set up parallel pool

poolobj = parpool('local',[2 30],'SpmdEnabled',false,'IdleTimeout',60);
disp(poolobj)

%% Main Loop

Costs = zeros(nPop,length(anatomies));

for j = 1:length(anatomies)
    % Environment setup
    Anatomyfilename = anatomies{j};
    disp('Using Anatomy file:')
    disp(Anatomyfilename)

    %Voxel Map
    Voxels = load(Anatomyfilename,'Voxel_data');

    % Cost Function
    CostFunction=@(design) FastFitnessFunctionVariableSegmentSnakeRobotPARAM(design,sample_size,Voxels,directory, testsetup);

    disp('Start') ;%Starting Snake Evolution Algorithm Creating Initial Population:');

    rng('shuffle');

    empty_individual.Position=[];
    empty_individual.Cost=[];
    empty_individual.Time=[];

    BestSol.Cost=inf;

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
end

disp(Costs)

% RResults_out = struct('Results',RResults);
% %Save the Results based on the design parameters
% result_file = strcat('Results');
save([directory, '/', 'Costs'], 'Costs');

%End parallel loop delete the pool object
delete(poolobj)
