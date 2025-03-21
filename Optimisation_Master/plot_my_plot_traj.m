function plot_my_plot_traj(jectories, alpha, n, d, frame)

% vector = TransformPoints(frame, point');
% vector = vector';
hold off
figure(getfignum1()) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hold on
% subtitle(['Design: alpha = ', num2str(alpha), '  n = ', num2str(n), ' d = ', num2str(d)])
for i = 1:size(jectories, 2)
    Traj = jectories{i};
    plot3(Traj(1, :), Traj(2, :), Traj(3, :), 'k-', 'LineWidth', 2) %%%%%%% ALE addition
end
% plot3(vector(1, :), vector(2, :), vector(3, :), '.', 'LineWidth', 5, 'Color', 'k')
hold off
   