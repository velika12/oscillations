function y_e = y_e_analytical( t )

global m c g
% m = 0.52; % kg
% c = 3.437; % N/m
% g = 9.815;

k = 40;
if(t <= 41.37) % point of derivatives' equality
    y_e = m*g/c - 0.122 * exp( -c*t/( k ) );
else 
    y_e = 0.00030*t + 1.469;
end

end

