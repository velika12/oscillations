function f = f( t, u, ampl, max )
m = 0.52; % kg
g = 9.815; % N/kg
c = 3.4231; % N/m
w = sqrt(c/m); % 1/s

C = [ 0 1;
      -w*w -w*fi(c, ampl, max)*0.5/(pi) ];
  
b = [ 0; 0 ];

f = C*u + b;

end

