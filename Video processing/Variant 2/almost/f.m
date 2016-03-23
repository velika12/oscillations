function f = f( t, u, ampl )
global m g c c_osc w
% m = 0.52; % kg
% g = 9.815; % N/kg
% c = 3.4231;
% c_osc = 3.0603; % N/m
k = 40;
% w = sqrt(c_osc/m); % 1/s

A = [ 0 1;
      -w*w -k_osc(ampl)/m ];
  
%b = [ 0; - c*( m*g-c*x_e(t) ) / k^2 ];
b = [0; 0];

f = A*u + b;

end

