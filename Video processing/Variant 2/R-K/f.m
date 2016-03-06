function f = f( t, u, ampl )
m = 0.52; % kg
g = 9.815; % N/kg
c = 3.4231;
c_osc = 3.0603; % N/m
w = sqrt(c_osc/m); % 1/s

A = [ 0 1;
      -w*w -k(ampl)/m ];
  
b = [ 0; g + c*( m*g-c*x_e( ampl, t ) )/k(ampl)^2 ];

f = A*u + b;

end

