function x_e = x_e( t )

m = 0.52; % kg
c = 3.437; % N/m
g = 9.815;

k = 40;
if(t <= 39)
    x_e = m*g/c - 0.122 * exp( -c*t/( k ) );
else 
    x_e = 0.00030*t + 1.469;
end

end

