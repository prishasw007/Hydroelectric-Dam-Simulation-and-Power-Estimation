function water_surface = reservoir_visualization(water_height)
%code here
data = load("project1_data.mat");
x = data.x;
y = data.y;
valley = data.valley;
[X,Y] = meshgrid(x,y);
water_surface = (X.*0) + 80';
valley_mask = (water_surface<valley);
dam_mask = Y < (-0.8 * X + 2200);
water_surface(valley_mask | dam_mask) = NaN;

% Open a new MATLAB Figure
figure;
% Define the set of colors to be used in this plot
colormap summer;
% Plot the valley
surf(X,Y,valley,EdgeColor="none");
% Configure the current plot so that new plot commands do not clear it
hold on;
% Plot the water and make it blue
surf(X,Y,water_surface,EdgeColor="none",FaceColor="Blue");
% labelling 
ylabel("x(m)") 
zlabel("height (m)")
xlabel("y(m)")
hold off;
saveas(gcf,'project1_output')
end