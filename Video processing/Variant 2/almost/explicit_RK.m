% Data from experiment - c, c_osc, w, m

L0new = L0; % New initial rubber length
Snew = S; % New rubber's area of cross section

% Find c_osc for calculation
c_osc = E * Snew / L0new;

tau = 0.001; % step
tspan = [0; 180]; %s

% initial values
% for rubber delta
y0 = 2.51457398273736;
ksi0 = y0 - y_e_analytical(tspan(1)); % time is 0
u0 = [ksi0; -1.37497924957696];

ampl = -6; % initial amplitude of the cycle (guess), m
eps = 0.001; % difference for ampl

% Matrix to save solution
sol = zeros(3,1);
sol(:,1) = [ tspan(1); u0 ];
shift(1) = y_e_analytical(tspan(1));

u = u0;
t = tspan(1);
i = 1; % index of solution column

% 1. Searching for the first right ampl
% (the beginning of the first cycle)
while true; 
    i = i + 1;

    k1 = f( t, u, ampl );
    k2 = f( t + tau*0.5, u + 0.5*tau*k1, ampl );
    k3 = f( t + tau*0.5, u + 0.5*tau*k2, ampl );
    k4 = f( t + tau, u + k3*tau, ampl );

    u = u + tau * ( k1 + 2*k2 + 2*k3 + k4 )/6;

    t = t + tau;

    sol(:,i) = [ t; u ];
    shift(i) = y_e_analytical(t);
    
    % if max or min
    if sol(3,i-1)*sol(3,i) < 0
        if( abs(ampl - sol(2,i-1)) > eps )
            ampl = sol(2,i-1);
            u = u0;
            t = tspan(1);
            i = 1;
        else
            t_init = t; % remember when the first ampl is
            break;
        end
    end

end

% 2. Calculating the next cycles
j = 0; % how many cycles we've passed?
while t < tspan(2)   
    i = i + 1;

    k1 = f( t, u, ampl );
    k2 = f( t + tau*0.5, u + 0.5*tau*k1, ampl );
    k3 = f( t + tau*0.5, u + 0.5*tau*k2, ampl );
    k4 = f( t + tau, u + k3*tau, ampl );

    u = u + tau * ( k1 + 2*k2 + 2*k3 + k4 )/6;

    t = t + tau;

    sol(:,i) = [ t; u ];
    shift(i) = y_e_analytical(t);
    
    if sol(3,i-1)*sol(3,i) < 0
        j = j + 0.5;
        if j - fix(j) == 0 % check we passed the whole cycle, not the half
            ampl = sol(2,i);
        end
    end
end 



%z = (sol(1,:) - 38.66)/22.33;

fin = sol(2,:) + shift;    %0.001126*z.^6 + 0.002285*z.^5 + 0.0004883*z.^4 + 0.0007962*z.^3 - 0.009244*z.^2 + 0.01409*z + 1.481;

figure(1)
plot(time, deltaLengthRubber, 'g', sol(1,:), fin)
grid on
grid minor
    