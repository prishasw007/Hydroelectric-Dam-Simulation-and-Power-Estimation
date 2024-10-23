function volume = reservoir_volume(water_height)
data = load("project1_data.mat");
x = data.x;
y = data.y;
valley = data.valley;
[X,Y] = meshgrid(x,y);
water_surface = (X.*0) + 80;
valley_mask = (water_surface<valley);
dam_mask = Y < (-0.8 * X + 2200);
water_surface(valley_mask | dam_mask) = NaN;
valley(valley>water) = 0 ;
depth = water - valley;
volume = 6.48364369*sum(sum(depth))
volume = volume * 10^-6
round(volume,2)