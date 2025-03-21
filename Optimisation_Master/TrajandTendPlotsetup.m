function [fignum1, fignum2] = TrajandTendPlotsetup(population_num, design_num, design, voxelsdata, Entranceframe )

Voxels = voxelsdata;

fignum1 = str2num([num2str(population_num), num2str(design_num), '1']);
fignum2 = str2num([num2str(population_num), num2str(design_num), '2']);

setfignum1(fignum1);
setfignum2(fignum2);

% Traj PLOT 
%figure(figurenumber)
figure(fignum1)
hold on
title('Successful Robot Paths')
subtitle(['Design: alpha = ', num2str(design.alpha), '  n = ', num2str(design.n), ' d = ', num2str(design.d)])
plotcoord3(Entranceframe,10,'r','g','b')
dx = 1; dy = 1; dz = 1;
%Plot Voxels
for ii = 1:abs(Voxels.Voxel_data.XBounds(1))+abs(Voxels.Voxel_data.XBounds(2))
    for jj = 1:abs(Voxels.Voxel_data.YBounds(1))+abs(Voxels.Voxel_data.YBounds(2))
        for kk = 1:abs(Voxels.Voxel_data.ZBounds(1))+abs(Voxels.Voxel_data.ZBounds(2))
            if Voxels.Voxel_data.Obstacle_labels(ii,jj,kk)==true
                hold on
                %Plot Obstacle Voxel
                plotprism(Entranceframe,Voxels.Voxel_data.vx(ii), Voxels.Voxel_data.vy(jj), Voxels.Voxel_data.vz(kk),dx,dy,dz,'r')              
            elseif Voxels.Voxel_data.Goal_labels(ii,jj,kk)==true
                hold on
                %Plot Goal Voxel
                plotprism(Entranceframe,Voxels.Voxel_data.vx(ii),Voxels.Voxel_data.vy(jj),Voxels.Voxel_data.vz(kk),dx,dy,dz,'g')
            end
        end
    end
end
hold off
% plot3(Voxels.Voxel_data.vx, Voxels.Voxel_data.vy, Voxels.Voxel_data.vz)

% TEND PLOT 

figure(fignum2) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hold on
title('End Effector Position')
subtitle(['Design: alpha = ', num2str(design.alpha), '  n = ', num2str(design.n), ' d = ', num2str(design.d)])
plotcoord3(Entranceframe,50,'r','g','b')
dx = 1; dy = 1; dz = 1;

%Plot Voxels
for ii = 1:abs(Voxels.Voxel_data.XBounds(1))+abs(Voxels.Voxel_data.XBounds(2))
    for jj = 1:abs(Voxels.Voxel_data.YBounds(1))+abs(Voxels.Voxel_data.YBounds(2))
        for kk = 1:abs(Voxels.Voxel_data.ZBounds(1))+abs(Voxels.Voxel_data.ZBounds(2))

            if Voxels.Voxel_data.Obstacle_labels(ii,jj,kk)==true
                hold on
                %Plot Obstacle Voxel
                plotprism(Entranceframe,Voxels.Voxel_data.vx(ii), Voxels.Voxel_data.vy(jj), Voxels.Voxel_data.vz(kk),dx,dy,dz,'r')
            elseif Voxels.Voxel_data.Goal_labels(ii,jj,kk)==true
                hold on
                %Plot Goal Voxel
                plotprism(Entranceframe,Voxels.Voxel_data.vx(ii),Voxels.Voxel_data.vy(jj),Voxels.Voxel_data.vz(kk),dx,dy,dz,'g')
            end
        end
    end
end
hold off