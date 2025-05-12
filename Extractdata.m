clc
clear all
close all

directory = pwd;
files = dir(directory);
optfiles = {};
resultfolders ={};

Timestructs = {};
FinishFiles = {};


% cases = {'_1', '_5', '12mm'}
% cases = {'_2', '_6', '14mm'}
% cases = {'_3', '_7', '18mm'}
cases = {'_4', '_8', '26mm'}

for i = 1:length(files)
    if contains(files(i).name, 'Opt') && (contains(files(i).name, cases{1})||contains(files(i).name, cases{2}));
        optfiles{end+1} = files(i).name;
    end
    if  contains(files(i).name, 'SnkEvl') && (contains(files(i).name, cases{3}));
        resultfolders{end+1} = files(i).name;
    end
end

optfiles =  sort(optfiles);
resultfolders = sort(resultfolders);
diaries = {};

currentdir = pwd;

for j = 1:length(resultfolders)
    cd(resultfolders{j})
    directory2 = pwd;
    curfiles = dir(directory2);
    Timestructs{end+1} = load('TimeStruct.mat'); % Extract Times
%     logText = fileread(optfiles{1});
    for i = 1:length(curfiles)
        if  contains(curfiles(i).name, 'Finished')
            FinishFiles{end+1} = load(curfiles(i).name); % Extract Main solution
        end
        if  contains(curfiles(i).name, 'diary')
            diaries{end+1} = fileread(curfiles(i).name); 
        end
    end
    cd ../
end



%% create a table [PBSjob, Best Dexterity, Best solution, Design space, Num unique designs, CPU time; Wall time; Mem Usage]
PBSjobs = zeros(length(optfiles), 1);
BestDexteritys = zeros(length(optfiles), 1);
BestSolutions = {};
DesignSpaces = zeros(length(optfiles), 1);
JobID = strings(length(optfiles), 1);
NumUniqueDesignss = zeros(length(optfiles), 1);
CPUtimes = strings(length(optfiles), 1);
WallTimes = strings(length(optfiles), 1);
MemUsages = zeros(length(optfiles), 1);


init_it_time_vector = strings(length(optfiles), 1);
total_it_time_vector = strings(length(optfiles), 1);
range_it_eval_time_vector = {};
average_it_eval_time_vector = strings(length(optfiles), 1);
ind_it_eval_times_vector = {};
ind_D_eval_times_vector = {};
total_opt_time_vector = strings(length(optfiles), 1);

match_index = zeros(length(diaries), 1);

for i = 1:length(optfiles)

    logText = fileread(optfiles{i});
%     disp(logText)

    % match Timestructs & FinishFiles to optfiles
    for index = 1:size(diaries,2)
        if  contains(logText, string(diaries{index}(end-500:end)))
            match_index(i, 1) = index;
        end
    end

    % Extract times etc
    indx = match_index(i);
    timedata = Timestructs{indx}.timestruct;

    init_it_time_vector(i,1) = string(duration(0, 0, round(timedata.init_it_time), 'Format', 'hh:mm:ss')); % timedata.init_it_time;
    total_it_time_vector(i,1) =  string(duration(0, 0, round(timedata.total_it_time), 'Format', 'hh:mm:ss')); % timedata.total_it_time
    range_it_eval_time_vector{end+1} =  [string(duration(0, 0, round(timedata.range_it_eval_time(1)), 'Format', 'hh:mm:ss')), string(duration(0, 0, round(timedata.range_it_eval_time(2)), 'Format', 'hh:mm:ss'))];  %timedata.range_it_eval_time(1)
    average_it_eval_time_vector(i,1) = string(duration(0, 0, round(timedata.average_it_eval_time), 'Format', 'hh:mm:ss')); % timedata.average_it_eval_time
    ind_it_eval_times_vector{end+1} =   timedata.ind_it_eval_times;
    ind_D_eval_times_vector{end+1} =   timedata.ind_D_eval_times;
    total_opt_time_vector(i,1) =  string(duration(0, 0, timedata.total_opt_time, 'Format', 'hh:mm:ss')); 


    % Extract .o file
    PBSjobs(i,1) = str2num(findthething('PBS Job ','.aqua', logText ));

    JobID(i,1) =  string(extractBefore(optfiles{i}, '.o'));

    BestDext = findthething('With best Dexterity:','\n', logText);
    BestDexteritys(i, 1) = str2num(regexprep(BestDext, '[^\w\d\.]', ''));

    BestSol = findthething('The Best solution was:', 'ith', logText);
    alpha = str2num(regexprep(extractBefore(extractAfter(BestSol, 'alpha: '), ' '),'[^\w\d\.]', ''));
    n = str2num(regexprep(extractBefore(extractAfter(BestSol, 'n: '), ' '),'[^\w\d\.]', ''));
    d = str2num(regexprep(extractBefore(extractAfter(BestSol, 'd: '), ' '),'[^\w\d\.]', ''));
    w = str2num(regexprep(extractBefore(extractAfter(BestSol, 'w: '), 'W'),'[^\w\d\.]', ''));
    BestSolutions{i} = [alpha, n, d, w];

    DesignSpaces(i, 1)  = str2num(regexprep(findthething('In a design space of this many designs:','Total', logText ),'[^\w\d\.]', ''));

    NumUniqueDesignss(i, 1)  = str2num(regexprep(findthething('Number of actual unique designs evaluated:','Number of actual repeated designs:', logText ),'[^\w\d\.]', ''));
   
    cpu = regexprep(findthething('CPU time  :','Wall', logText ),'[^\w\d\.\:]', '');   
    CPUtimes(i,1) = string(cpu);

    WallTimes(i,1) = string(regexprep(findthething('Wall time :','Mem', logText ),'[^\w\d\.\:]', ''));

    memindx =findthething('Mem usage :', 'kb', logText);% strfind(logText, 'Mem usage :');
    MemUsages(i,1) = str2num(memindx)/(1e6); %string(regexprep( logText(memindx+length('Mem usage :'):end),'[^\w\d\.\:]', ''));

end

resultTable = table(JobID, PBSjobs, BestDexteritys, BestSolutions', DesignSpaces, ...
        NumUniqueDesignss, range_it_eval_time_vector', average_it_eval_time_vector, CPUtimes, ...
        init_it_time_vector, total_it_time_vector, WallTimes, total_opt_time_vector, ...
        MemUsages,ind_it_eval_times_vector',  ind_D_eval_times_vector',...
        'VariableNames', {'JobID','PBSjob', 'BestDexterity', 'BestSolution', ...
        'DesignSpace', 'NumUniqueDesigns', 'Iteration Evaluation time range', ...
        'average_it_eval_time_vector', 'CPUtime_sec','It 0 time','total_it_time_vector', ...
        'WallTime', 'Total opt time' 'MemUsage (GB)', 'ind_it_eval_times_vector', 'ind_D_eval_times_vector' });

disp(resultTable)

function extractedthing = findthething(text2find, endtext, where2look)

startIdx = strfind(where2look, text2find);
subStr = where2look(startIdx:end);
idxEnd = strfind(subStr, endtext);
extractedthing = subStr(length(text2find)+1:idxEnd(1) - 1);

end