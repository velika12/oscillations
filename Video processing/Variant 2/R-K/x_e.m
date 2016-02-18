function x_e = x_e( ampl, t, max )

m = 0.52; % kg
c = 3.4231; % N/m
c_osc = 3.0603;
g = 9.815;
w = sqrt(c_osc/m); % 1/s

x_e = m*g/c - 0.128 * exp( -c*c_osc*0.5*fi( c_osc, ampl, max)*t / ( pi*w ) );

end

