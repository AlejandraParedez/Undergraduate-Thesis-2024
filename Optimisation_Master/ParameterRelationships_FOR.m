% Differential Evolution script
% SnakeRaven Optimisation on HPC
% Andrew Razjigaev 11 Feb 2021

clc;
clear;
close all;

%% Create Directory on HPC-Drive for all the results to go into:
addpath(pwd);
%Create a directory name based on the current time
directory = strcat('PS_',strrep(strrep( datestr(datetime, 'dd-mm HH:MM:SS') ,':','_'),' ','_'));

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
%% TEST CASE : Sample Size 1 %% n = 3
% Change the following to suit test case:
RV = 'F'; % Translational & Rotational & Full
target = 'SE10'; % Side Extruded 10mm down from entrance -> T == TARGET
environment = 'NTest_SBSE10'; % Square box INCLUDE ANY OTHER IDENTIFIER AT BEGINNING OF THIS STRING

samplesize = '5e8_w1d3n3'; % INCLUDES PARAM INFO TOO (00 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

TestCase_SampleSize1.N = 5*1e6;

TestCase_SampleSize1.changingvector = 90;

TestCase_SampleSize1.alpha = deg2rad(90);
TestCase_SampleSize1.w = 1;
TestCase_SampleSize1.d = 3;
TestCase_SampleSize1.n = 3;

TestCase_SampleSize1.RavenLimits_yrot = pi/4;
TestCase_SampleSize1.RavenLimits_xrot = pi/4;
TestCase_SampleSize1.RavenLimits_tranmin = 0;
TestCase_SampleSize1.RavenLimits_tranmax = 80; 
TestCase_SampleSize1.changingvar = 'alpha'; % Doesn't matter yet (Needs to be updated for next test phase)

TestCase_SampleSize1.anatomies = {'VoxelData_SBSE10_30mmw1_17Apr2025.mat'};

% IDs and Description Strings (Don't touch this)
TestCase_SampleSize1.environment = environment;
TestCase_SampleSize1.ID = [environment,'_', 'N', samplesize, '_RV_', RV, '_T_', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
TestCase_SampleSize1.descript = ['RV: ', RV, '   Target: ', target];

%% TEST CASE : Sample Size 2 %% n = 3
% Change the following to suit test case:
RV = 'F'; % Translational & Rotational & Full
target = 'SE20'; % Side Extruded 20mm down from entrance -> T == TARGET
environment = 'SampleSizeTesting_SBSE20'; % Square box INCLUDE ANY OTHER IDENTIFIER AT BEGINNING OF THIS STRING

samplesize = '5e8_w1d3n3'; % INCLUDES PARAM INFO TOO (00 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

TestCase_SampleSize2.N = 5*1e6;

TestCase_SampleSize2.changingvector = 90;

TestCase_SampleSize2.alpha = deg2rad(90);
TestCase_SampleSize2.w = 1;
TestCase_SampleSize2.d = 3;
TestCase_SampleSize2.n = 3;

TestCase_SampleSize2.RavenLimits_yrot = pi/4;
TestCase_SampleSize2.RavenLimits_xrot = pi/4;
TestCase_SampleSize2.RavenLimits_tranmin = 0;
TestCase_SampleSize2.RavenLimits_tranmax = 80; 
TestCase_SampleSize2.changingvar = 'alpha'; % Doesn't matter yet (Needs to be updated for next test phase)

TestCase_SampleSize2.anatomies = {'VoxelData_SBSE20_30mmw1_17Apr2025.mat'};

% IDs and Description Strings (Don't touch this)
TestCase_SampleSize2.environment = environment;
TestCase_SampleSize2.ID = [environment,'_', 'N', samplesize, '_RV_', RV, '_T_', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
TestCase_SampleSize2.descript = ['RV: ', RV, '   Target: ', target];

%% TEST CASE : Sample Size 3 %% n = 4
% Change the following to suit test case:
RV = 'F'; % Translational & Rotational & Full
target = 'SE10'; % Side Extruded 10mm down from entrance -> T == TARGET
environment = 'NTest_SBSE10'; % Square box INCLUDE ANY OTHER IDENTIFIER AT BEGINNING OF THIS STRING

samplesize = '5e8_w1d3n4'; % INCLUDES PARAM INFO TOO (00 to identfy changing var) &&&& DOUBLE CHECK THIS IS SAME VALUE AS N !!!!!!!!!!

TestCase_SampleSize3.N = 5*1e6;

TestCase_SampleSize3.changingvector = 90;

TestCase_SampleSize3.alpha = deg2rad(90);
TestCase_SampleSize3.w = 1;
TestCase_SampleSize3.d = 3;
TestCase_SampleSize3.n = 4;

TestCase_SampleSize3.RavenLimits_yrot = pi/4;
TestCase_SampleSize3.RavenLimits_xrot = pi/4;
TestCase_SampleSize3.RavenLimits_tranmin = 0;
TestCase_SampleSize3.RavenLimits_tranmax = 80; 
TestCase_SampleSize3.changingvar = 'alpha'; % Doesn't matter yet (Needs to be updated for next test phase)

TestCase_SampleSize3.anatomies = {'VoxelData_SBSE10_30mmw1_17Apr2025.mat'};

% IDs and Description Strings (Don't touch this)
TestCase_SampleSize3.environment = environment;
TestCase_SampleSize3.ID = [environment,'_', 'N', samplesize, '_RV_', RV, '_T_', target, '_']; % anatomytype_ravenlimits_Translation(andor)rotation_targettype_S or D (S = side, D = direct)
TestCase_SampleSize3.descript = ['RV: ', RV, '   Target: ', target];

%% 
Cases = [TestCase_SampleSize1, TestCase_SampleSize2, TestCase_SampleSize3];

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

diary off

