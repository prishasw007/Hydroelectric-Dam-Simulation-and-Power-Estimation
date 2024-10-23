function power_gw = max_power(water_height, efficiency, mass_rate)
power_gw = mass_rate*efficiency*water_height*9.81
power_gw = power_gw * 10^-9
power_gw = round(power_gw,2)