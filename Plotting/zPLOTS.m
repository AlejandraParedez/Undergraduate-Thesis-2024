% Plot the results for the DOF Two Segment Snake Evolution Experiments:
% Andrew Razjigaev 22 September 2020
% Hint: use print(gcf,'evolution2.eps','-depsc','-r600'); to save figure
clc;
clear;
close all;

%% Load Data here:
addpath(pwd);
%cd('Snake2_1_10_results')

%  b 4 target model 

% Single target, Small model
%cd('Snake_Evolution_Results26-May-2024_14_07_33')' %1 a
%cd('Snake_Evolution_Results22-Aug-2024_20_53_14') %2 a
%cd('Snake_Evolution_Results23-Aug-2024_10_42_56') %3 a


%4 Targets (b)
%cd('Snake_Evolution_Results30-Aug-2024_08_25_15') %4 b
%cd('Snake_Evolution_Results30-Aug-2024_08_38_11') %5 b killed

% Single Param
% cd('Snake_Evolution_Results30-Aug-alpha') % b
% cd('Snake_Evolution_Results30-Aug-d') % b
% cd('Snake_Evolution_Results30-Aug-n') %b

% larger sample size model %b
cd('Snake_Evolution_Results12-Sep-2024 01_14_21')

tests_done = 1;
max_iter = 100;

Snake = cell(tests_done,1);
%Snake{1} = 'Snake_Evolution_Results26-May-2024_14_07_33 Finished_26-May-2024_16_01_53.mat'; 
%Snake{1} = 'Snake_Evolution_Results22-Aug-2024_20_53_14 Finished_22-Aug-2024_21_01_21.mat';
%Snake{1} = 'Snake_Evolution_Results23-Aug-2024_10_42_56 Finished_23-Aug-2024_10_59_27.mat'; % 3
%Snake{1} = 'Snake_Evolution_Results30-Aug-2024_08_25_15 Finished_30-Aug-2024_08_54_45.mat'; % 4
%Snake{1} = 'Snake_Evolution_Results23-Aug-2024_10_42_56 Finished_23-Aug-2024_10_59_27.mat'; % killed

%Single Param (b)
%Snake{1} = 'Snake_Evolution_Results30-Aug-2024_11_56_48 Finished_30-Aug-2024_12_01_00.mat'; % alpha
%Snake{1} = 'Snake_Evolution_Results30-Aug-2024_10_16_57 Finished_30-Aug-2024_10_53_19.mat'; % d
%Snake{1} = 'Snake_Evolution_Results30-Aug-2024_12_05_01 Finished_30-Aug-2024_12_06_19.mat'; % n

% larger sample size model %b
Snake{1} = 'Snake_Evolution_Results12-Sep-2024 01_14_21 Finished_12-Sep-2024_02_05_45.mat';


% Primary Dataset
V = load(Snake{1}); %best one that was printed!

%Anatomy files
%Anatomyfilename = 'VoxelData26May2024goodfeeling.mat'; % a
Anatomyfilename = 'VoxelData30Aug2024AM0653.mat'; % b


%% Evolution Fitness over time Plot:

disp('Evolution Results. The Best solution was:');
disp(vector2designstruct(V.BestSol.Position))
disp('With best Dexterity:')
disp(-1*V.BestSol.Cost)
disp('\n');

%Plot Line of Evolution Best cost over time
figure;
for ii = 1:tests_done
    Data = load(Snake{ii});
    plot(-1*Data.BestCost,'LineWidth', 2);
    hold on
end
title('Dexterity Fitness Over Time');
xlabel('Iteration');
ylabel('Best Dexterity Fitness');
grid on;
legend('Location','East');

%Plot Mean and standard deviation range Lines of Evolution Best cost over time
All_data = zeros(max_iter,tests_done);
for ii = 1:tests_done
    Data = load(Snake{ii});
    All_data(:,ii) = -1*Data.BestCost;
end

mean_fitness = mean(All_data,2);
sigma_fitness = std(All_data,0,2);
Upper_line = mean_fitness + sigma_fitness;
Lower_line = mean_fitness - sigma_fitness;

figure;
generations = linspace(1,max_iter,max_iter)';
plot(generations,Upper_line,'b-','LineWidth', 2); hold on;
plot(generations,Lower_line,'b-','LineWidth', 2); hold on;
%plot shaded area %hintpatch works point to point clockwise X goes from 1
%to 100 and back to 1, while Y is the lower line then back along the upper
%line
patch([generations; fliplr(generations')'],[Lower_line; fliplr(Upper_line')'],[0.7 0.7 1])

plot(mean_fitness,'r-','LineWidth', 2); hold on;
title('Mean Fitness and Standard Deviation Over Time');
xlabel('Iteration');
ylabel('Best Dexterity Fitness');
grid on;

%Save evolution over time data for combined plot
two_seg_fit.u = Upper_line;
two_seg_fit.m = mean_fitness;
two_seg_fit.l = Lower_line;
save('two_seg_fitness','two_seg_fit');

%% Box and Whisker plot of Parameter space:
nVar = length(V.BestSol.Position);
alpha_bounds = [0.01 pi/2];
n_bounds = [1 10];
d_bounds = [1 10];
figure;
if nVar==3
    %One Segment Design
    alpha = zeros(tests_done,1); n = zeros(tests_done,1); d = zeros(tests_done,1);
    %Load Data
    for ii = 1:tests_done
        Data = load(Snake{ii});
        alpha(ii) = Data.BestSol.Position(1);
        n(ii) = Data.BestSol.Position(2);
        d(ii) = Data.BestSol.Position(3);
    end  
    %Create Boxplots
    subplot(1,3,1)
    boxplot(alpha,'Labels',{'Alpha'})
    ylim(alpha_bounds) %set(gca,'YTick',alpha_bounds(1):0.1:alpha_bounds(2))
    
    subplot(1,3,2)
    boxplot(n,'Labels',{'n'})
    ylim(n_bounds)
    
    subplot(1,3,3)
    boxplot(d,'Labels',{'d'})
    ylim(d_bounds)
    
    %mtit('Comparison of parameters for the Best Designs')
else
    %Two Segment Design
    alpha1 = zeros(tests_done,1); n1 = zeros(tests_done,1); d1 = zeros(tests_done,1);
    alpha2 = zeros(tests_done,1); n2 = zeros(tests_done,1); d2 = zeros(tests_done,1);
    %Load Data
    for ii = 1:tests_done
        Data = load(Snake{ii});
        alpha1(ii) = Data.BestSol.Position(1);
        n1(ii) = Data.BestSol.Position(2);
        d1(ii) = Data.BestSol.Position(3);
        alpha2(ii) = Data.BestSol.Position(4);
        n2(ii) = Data.BestSol.Position(5);
        d2(ii) = Data.BestSol.Position(6);
    end
    %Create Boxplot
    subplot(1,6,1)
    boxplot(alpha1,'Labels',{'Proximal Alpha'})
    ylim(alpha_bounds)
    
    subplot(1,6,2)
    boxplot(n1,'Labels',{'Proximal n'})
    ylim(n_bounds)
    
    subplot(1,6,3)
    boxplot(d1,'Labels',{'Proximal d'})
    ylim(d_bounds)
    
    subplot(1,6,4)
    boxplot(alpha2,'Labels',{'Distal Alpha'})
    ylim(alpha_bounds)
    
    subplot(1,6,5)
    boxplot(n2,'Labels',{'Distal n'})
    ylim(n_bounds)
    
    subplot(1,6,6)
    boxplot(d2,'Labels',{'Distal d'})
    ylim(d_bounds)
    
    two_seg_box.alpha1 = alpha1; two_seg_box.alpha2 = alpha2;
    two_seg_box.n1 = n1; two_seg_box.n2 = n2;
    two_seg_box.d1 = d1; two_seg_box.d2 = d2;
    save('two_seg_boxplot','two_seg_box');
    
    mtit('Comparison of parameters for the Best Designs')
end

%% Best Solution Fitness Function Results

%Now get the best solution:
design = vector2designstruct(V.BestSol.Position);

%Get result file
result_file = strcat('Design_alpha',...
    strrep(strrep(strrep(strrep(num2str(design.alpha),'.',''),'        ','_'),'___','_'),'__','_'),...
    '_n',strrep(strrep(num2str(design.n),'.',''),'  ','_'),...
    '_d',strrep(strrep(strrep(strrep(num2str(design.d),'.',''),'        ','_'),'___','_'),'__','_'));


%Plot Visualisation of design, maximum service sphere and dexterity
%distribution
PlotResultsForFitnessFunction(result_file,Anatomyfilename)

% % % %% Determine Design results for each Target needed for Hypothesis Test:
% % % 
% % % %Create Vector X:
% % % X = zeros(4,tests_done);
% % % % This is a matrix of 4 rows of targets and the mean dexterity over all
% % % % test columns
% % % for jj=1:4
% % %     %Targets:
% % %     for ii=1:tests_done
% % %         V = load(Snake{ii});
% % %         %disp(ii)
% % %         %Get solution file:
% % %         design = vector2designstruct(V.BestSol.Position);
% % %         result_file = strcat('Design_alpha',...
% % %         strrep(strrep(strrep(strrep(num2str(design.alpha),'.',''),'        ','_'),'___','_'),'__','_'),...
% % %         '_n',strrep(strrep(num2str(design.n),'.',''),'  ','_'),...
% % %         '_d',strrep(strrep(strrep(strrep(num2str(design.d),'.',''),'        ','_'),'___','_'),'__','_'));
% % %         %Find Dexterity:
% % %         [X(jj,ii),~] = mask_dexterity_distribution(result_file,Anatomyfiles{jj});
% % %     end
% % % end
% % % disp('Best Fitness Dexterity Vector for each of the four targets as row:')
% % % disp(X)
% % % save('two_seg_baseline','X');

% %% Conduct Comparing DOF hypothesis Tests:
% 
% %Load Rigid Tool results:
% rigid = load('Rigid_tool_baseline');
% rigid_results = rigid.rigid_results;
% disp('Rigid Tool Fitness Vector')
% disp(rigid_results)
% 
% %Load One DOF tool Results
% one_seg = load('one_seg_baseline');
% one_seg_results = one_seg.one_seg_results;
% disp('One Segment Design Fitness Vector')
% disp(one_seg_results)
% 
% %Two Segment Results vector:
% Y = zeros(1,tests_done);
% for ii=1:tests_done
%     V = load(Snake{ii});
%     Y(ii) = -1*V.BestSol.Cost;
% end
% disp('Two Segment Design Fitness Vector')
% disp(Y)
% 
% %Hypothesis Test:
% [P,H] = ranksum(rigid_results,one_seg_results,'alpha',0.01,'tail','left','method','exact');
% %[P,H] = ranksum(rigid_results,one_seg_results);
% disp(['P-value: ' num2str(P) ])
% if H
%     disp('Reject null hypothesis: significant evidence One Segment Design is better than Rigid Tool')
% else
%     disp('accept null hypothesis: no evidence of advantage with One Segment Design and Rigid Tool')
% end
% 
% %[P,H] = ranksum(rigid_results,Y);
% [P,H] = ranksum(rigid_results,Y,'alpha',0.01,'tail','left','method','exact');
% disp(['P-value: ' num2str(P) ])
% if H
%     disp('Reject null hypothesis: significant evidence Two Segment Design is better than Rigid Tool')
% else
%     disp('accept null hypothesis: no evidence of advantage with Two Segment Design and Rigid Tool')
% end
% 
% %[P,H] = ranksum(one_seg_results,Y);
% [P,H] = ranksum(one_seg_results,Y,'alpha',0.01,'tail','left','method','exact');
% disp(['P-value: ' num2str(P) ])
% if H
%     disp('Reject null hypothesis: significant evidence Two Segment Design is better than One Segment Design')
% else
%     disp('accept null hypothesis: no evidence of advantage with Two Segment Design and One Segment Design')
% end
