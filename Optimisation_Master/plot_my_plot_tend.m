function plot_my_plot_tend(point, alpha, n, d, frame)
hold off


vector = TransformPoints(frame, point');
vector = vector';
figure(getfignum2()) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hold on
%subtitle(['Design: alpha = ', num2str(alpha), '  n = ', num2str(n), ' d = ', num2str(d)])
plot3(vector(1, :), vector(2, :), vector(3, :), '.', 'LineWidth', 5, 'Color', 'k')
hold off



% % for i = 1:size(point, 2)
%     vector = TransformPoints(frame, point(:,i)');
%     vector = vector';
%     figure(getfignum2()) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     hold on
%     %subtitle(['Design: alpha = ', num2str(alpha), '  n = ', num2str(n), ' d = ', num2str(d)])
%     plot3(vector(1, :), vector(2, :), vector(3, :), '.', 'LineWidth', 5, 'Color', 'k')
%     hold off
% 
% % end