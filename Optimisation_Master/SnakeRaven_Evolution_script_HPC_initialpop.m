% Differential Evolution script
% SnakeRaven Optimisation on HPC
% Andrew Razjigaev 11 Feb 2021

clc;
clear;
close all;

Opt_time = tic;

%% File naming

TestType = '4';
Anatomyfilename = 'VoxelData_SBSE10_10mmw3_.mat';  

Environmentinfo = extractAfter(extractBefore(Anatomyfilename, '_.mat'), '_');
dir_name = join(['SnkEvl_', TestType, '_', Environmentinfo]);

%% Create Directory on HPC-Drive for all the results to go into:
addpath(pwd);
%Create a directory name based on the current time
directory = strcat(dir_name,strrep(strrep(datestr(datetime),':','_'),' ','_'));

%Create new directory ensure it doesn't already exist
[~, msg, ~] = mkdir(directory);
pause(5)

%If it already exists i.e. a message about it keeps appearing, try again until it works
%this happens if the job was run at the same time in seconds as another evolution job
while(~isempty(msg))
    directory = strcat(dir_name,strrep(datestr(datetime),':','_'));
    [~, msg, ~] = mkdir(directory);
    pause(3)
end

disp('All fitness results in this logfile are being saved in folder:');
disp(directory)

%Add path to directory
addpath(directory);

% Save diary (command window)
diary( strcat( directory, '/', 'diary', strrep(datestr(datetime),':','_')) )


%% Anatomy Voxelization:
% Anatomyfilename = 'VoxelData_SBSE10_10mmw1_.mat';  

sample_size = 1*1e8; %must be larger than 9100*(18*9) orientation patches ***********% must be larger than 1474200

disp('Using Anatomy file:')
disp(Anatomyfilename)
disp('Configuration sample size:')
disp(sample_size)

%% Problem Definition
%Voxel Map
Voxels = load(Anatomyfilename,'Voxel_data');

% Cost Function
CostFunction=@(design) FastFitnessFunctionVariableSegmentSnakeRobot(design,sample_size,Voxels,directory);

nVar=3;            % Number of Decision Variables
%nVar=6;            % One or Two segment variables 

VarSize=[1 nVar];   % Decision Variables Matrix Size

% alpha n d, bounds: [lower upper]
% % alpha_bounds = [0.01 pi/2];
% % n_bounds = [1 5];
% % d_bounds = [1, 10]; %[1 10];


alpha_bounds = [deg2rad(2) pi/2];
n_bounds = [2 3];
d_bounds = [1, 2]; %[1 10];
w = str2num(extractAfter(extractBefore(Anatomyfilename, '_.mat'), 'w'));

% resolution of alpha, n and d
res = [0.01 1 0.01]; 
if nVar==3
    % One segment
    VarMin=[alpha_bounds(1) n_bounds(1) d_bounds(1)];          % Lower Bound of Decision Variables
    VarMax=[alpha_bounds(2) n_bounds(2) d_bounds(2)];          % Upper Bound of Decision Variables
    disp('Solving a one segment design 3 variables')
    %Solve the design space:
    disp('That makes a design space of this many designs:')
    N_alpha = round((alpha_bounds(2) - round(alpha_bounds(1),2))/res(1)) + 1; % that is 157
    N_n = round((n_bounds(2) - n_bounds(1))/res(2)) + 1; %that is 10
    N_d = round((d_bounds(2) - d_bounds(1))/res(3)) + 1; % that is 901
    Design_space = N_alpha*N_n*N_d;
    disp(Design_space)
elseif nVar==6
    % Two segment
    VarMin=[alpha_bounds(1) n_bounds(1) d_bounds(1) ...
        alpha_bounds(1) n_bounds(1) d_bounds(1)];          % Lower Bound of Decision Variables
    VarMax=[alpha_bounds(2) n_bounds(2) d_bounds(2) ...
        alpha_bounds(2) n_bounds(2) d_bounds(2)];          % Upper Bound of Decision Variables  
    disp('Solving a two segment design 6 variables')
    %Solve the design space:
    disp('That makes a design space of this many designs:')
    N_alpha = round((alpha_bounds(2) - round(alpha_bounds(1),2))/res(1)) + 1; % that is 157
    N_n = round((n_bounds(2) - n_bounds(1))/res(2)) + 1; %that is 10
    N_d = round((d_bounds(2) - d_bounds(1))/res(3)) + 1; % that is 901
    Design_space = N_alpha*N_n*N_d*N_alpha*N_n*N_d;
    disp(Design_space)
end

%% DE Parameters

MaxIt= 50;      % Maximum Number of Iterations/gnerations

nPop= 10*nVar;        % Population Size

F = 0.5;        % Amplification Factor 0 - 2

pCR = 0.8;        % Crossover Probability

disp(['Running for ' num2str(MaxIt) ' iterations/generations'])
disp(['population size: ' num2str(nPop)])
% disp(['Mutation factor range: ' num2str(beta_min) ' to ' num2str(beta_max)]) 
disp(['Amplification/mutation factor: ' num2str(F)])
disp(['Crossover Probability: ' num2str(pCR)])

%% Set up parallel pool

poolobj = parpool('local',[2 30],'SpmdEnabled',false,'IdleTimeout',60);
disp(poolobj)

%% Initialization

disp('Starting Snake Evolution Algorithm Creating Initial Population:');

rng('shuffle'); 
% Avoids Repeating the same number generator for 
% every instance of this script on HPC
% https://au.mathworks.com/help/matlab/math/why-do-random-numbers-repeat-after-startup.html
% https://au.mathworks.com/help/matlab/ref/rng.html
%
% Initializes generator based on the current time, resulting in a different 
% sequence of random numbers after each call to rng. As jobs are forced to
% have unique folders based on time, each instance will therefore have a
% different sequence of random umbers

empty_individual.Position=[];
empty_individual.Cost=[];
empty_individual.Time=[];

BestSol.Cost=inf;

pop=repmat(empty_individual,nPop,1);

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
pre_designs = {[pi/2, 3, 1]}; % % % [a n d] % % %
predesigned_count = 0;

%%
disp('Iteration 0 has started...');
init_it_tic = tic;
for i= 1:nPop 
%     disp(['Iteration ' num2str(it) ' has started...']);

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
        % Unique Design needs To be calculated
        func_iter = func_iter + 1;
        tic
        pop(i).Cost=-1*CostFunction(vector2designstruct(pop(i).Position, w));
        toc
        pop(i).Time = toc;
    end
    
    disp('Dexterity score for This design was:')
    disp(-1*pop(i).Cost)
    
    if pop(i).Cost<BestSol.Cost
        BestSol=pop(i);
    end
    
    %Record population member and data:
    Allpop{i,1} = pop(i).Position;
    Allcost{i,1} = pop(i).Cost;
    Alltime{i,1} = pop(i).Time;
    
end

disp('Iteration 0 has finished...');
init_it_toc = toc(init_it_tic);

BestCost=zeros(MaxIt,1);

%% DE Main Loop

all_it_tic = tic;
ind_pop_tics = size(MaxIt, 1);
for it=1:MaxIt

    init_pop_tic = tic;
    
    disp(['Iteration ' num2str(it) ' has started...']);

    for i=1:nPop
        
        x=pop(i).Position; % Get Population member gene
        
        A=randperm(nPop); % Get a random ordering of the population
        
        A(A==i)=[]; %Ensure the order doesn't include the current member
        
        a=A(1);
        b=A(2);
        c=A(3);
        
        % Mutation
        %V = Xr1 + F (Xr2 - Xr3)
        v = pop(a).Position + F.*(pop(b).Position - pop(c).Position);
        
        % rescale into bounds i.e. saturate min and max after mutation
        v = rescale_design_into_bounds(v,VarMin,VarMax);
		
        % Crossover
        u=zeros(size(x));
        j0=randi([1 numel(x)]);
        for j=1:numel(x)
            if j==j0 || rand<=pCR
                u(j)=v(j);
            else
                u(j)=x(j);
            end
        end
        
        % rescale into bounds i.e. saturate min and max after crossover
        NewSol.Position=rescale_design_into_bounds(u,VarMin,VarMax);
        
        % Run the Fitness Function
        disp(['Testing member ' num2str(i) ' of generation ' num2str(it)]);
        disp('Evaluating design: ')
        disp(vector2designstruct(NewSol.Position,w))

        %Check if the design has already been tested:
        [was_tested, prior_cost, prior_time] = is_member_already_tested(NewSol.Position,Allpop,Allcost,Alltime);
    
        if was_tested
            repeat = repeat + 1;
            disp('Already Evaluated skipping recalculation')
            NewSol.Cost = prior_cost;
            NewSol.Time = prior_time;
        else 
            %Unique Design needs To be calculated
            func_iter = func_iter + 1;
            tic
            NewSol.Cost=-1*CostFunction(vector2designstruct(NewSol.Position, w));
            toc
            NewSol.Time = toc;
        end           
    
        disp('Dexterity score for This design was:')
        disp(-1*NewSol.Cost)
        
        %Record New population member and data:
        Allpop{i,it+1} = NewSol.Position;
        Allcost{i,it+1} = NewSol.Cost;
        Alltime{i,it+1} = NewSol.Time;
        
        %Survival of the fittest:
        if NewSol.Cost<pop(i).Cost
            pop(i)=NewSol;
            
            if pop(i).Cost<BestSol.Cost
               BestSol=pop(i);
            end
        end
       
    end
    
    % Update Best Cost
    BestCost(it)=BestSol.Cost;
    
    % Show Iteration Information
    disp(['Iteration ' num2str(it) ' finished: Best Cost = ' num2str(-BestCost(it))]);
    disp('\n');
    
    %Saving backup data after a generation
    cd(directory);
    %Create Backup results file:
    BackupResults = struct('BestSol',BestSol,...
        'BestCost',BestCost,...
        'Max_Iterations',it,...
        'populations_history',cell2mat(Allpop),...
        'costs_history',cell2mat(Allcost),...
        'time_history',cell2mat(Alltime));
    save('Snake_Evolution_Backup','-struct','BackupResults');
    cd ..

    ind_pop_tics(it,1) = toc(init_pop_tic);
end

all_it_toc = toc(all_it_tic);
disp(join(['Total Evaluation time for ', num2str(MaxIt), ' generations:' ] ))
disp(join([ num2str(all_it_toc), ' seconds']))


%% Show Results
%End parallel loop delete the pool object
delete(poolobj)

%Closing Message:
disp('Evolution time complete. The Best solution was:');
disp(vector2designstruct(BestSol.Position,w))
disp('With best Dexterity:')
disp(-1*BestSol.Cost)
disp('\n');

%Show some statistics:
disp('In a design space of this many designs:')
disp(Design_space)
disp('Total Fitness evaluations called for evolution:')
disp(nPop * (MaxIt+1))
disp('Number of actual unique designs evaluated:')
disp(func_iter)
disp('Number of actual repeated designs:')
disp(repeat)

%Create Optimal results file:
OptimResults = struct('BestSol',BestSol,...
    'BestCost',BestCost,...
    'Max_Iterations',MaxIt,...
    'populations_history',cell2mat(Allpop),...
    'costs_history',cell2mat(Allcost),...
    'time_history',cell2mat(Alltime));
%Reverse Allpop matrix array back to cell array
%mat2cell(OptimResults.populations_history,ones(1,nPop),nVar*ones(1,MaxIt+1))

%Save the Results
Evolution_file = strcat(directory,' Finished_ ',strrep(strrep(datestr(datetime),':','_'),' ','_'));

%Save Evolutionresults until works:
%if directory access failure retry save until works
not_worked = true;
cd(directory);
while not_worked
    try
        %save(strcat(directory,'/',Evolution_file),'-struct','OptimResults');
        save(Evolution_file,'-struct','OptimResults');
        not_worked = false;
        disp('Save successful end of evolution')
    catch
        disp('Save failed retrying...')
        not_worked = true;
        pause(5)
    end
end

total_Opt_time = toc(Opt_time);


%% Save time data struct

timestruct.init_it_time = init_it_toc;
timestruct.total_it_time = all_it_toc; % Time to run all generations except initialisation.

timestruct.range_it_eval_time = [min(ind_pop_tics), max(ind_pop_tics)];
timestruct.average_it_eval_time = mean(ind_pop_tics);
timestruct.ind_it_eval_times = ind_pop_tics; % time to run each pop

timestruct.ind_D_eval_times = Alltime; % This is already included in backup results. Time to run the cost function!
timestruct.total_opt_time = total_Opt_time;

save(fullfile('TimeStruct'), 'timestruct');


diary off

