function k = k( ampl )
m = 0.52; % kg
c_osc = 3.0603; % N/m
w = sqrt(c_osc/m); % 1/s

k = fi(ampl) * c_osc / (2*pi*w);

end

