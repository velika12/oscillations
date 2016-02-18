function x_e = x_e( ampl, t, max )

m = 0.52; % kg
c = 3.4231; % N/m
g = 9.815;
w = sqrt(c/m); % 1/s

x_e = m*g/c - 0.128 * exp( -c*c*0.5*fi( c, ampl, max)*t / ( pi*w ) );

end

