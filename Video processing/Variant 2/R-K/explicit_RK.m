clear
load('only_rubber.mat')
m = 0.52; % kg
c = 3.4231; % N/m
g = 9.815;
w = sqrt(c/m); % 1/s

tau = 0.001; % step
tspan = [0; 160]; %s

% initial values
% for rubber delta
ksi0 = 2.51457398273736;
x0 = ksi0 - x_e(0, tspan(1), false); % time is 0
u0 = [x0; -1.37497924957696];

ampl = 0; % initial amplitude of the cycle (guess), m
max = false;
eps = 0.001; % difference for ampl

% Matrix to save solution
sol = zeros(3,1);
sol(:,1) = [ tspan(1); u0 ];
shift(1) = x_e(0, tspan(1), false);

u = u0;
t = tspan(1);
i = 1; % index of solution column

% 1. Searching for the first right ampl
% (the beginning of the first cycle)
while true; 
    i = i + 1;

    k1 = f( t, u, ampl, max );
    k2 = f( t + tau*0.5, u + 0.5*tau*k1, ampl, max );
    k3 = f( t + tau*0.5, u + 0.5*tau*k2, ampl, max );
    k4 = f( t + tau, u + k3*tau, ampl, max );

    u = u + tau * ( k1 + 2*k2 + 2*k3 + k4 )/6;

    t = t + tau;

    sol(:,i) = [ t; u ];
    shift(i) = x_e(ampl, t, max);
    
    if sol(3,i-1) > 0 && sol(3,i) <= 0
        max = true;
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
    
    if sol(3,i-1) < 0 && sol(3,i) >= 0
        max = false;
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

    k1 = f( t, u, ampl, max );
    k2 = f( t + tau*0.5, u + 0.5*tau*k1, ampl, max );
    k3 = f( t + tau*0.5, u + 0.5*tau*k2, ampl, max );
    k4 = f( t + tau, u + k3*tau, ampl, max );

    u = u + tau * ( k1 + 2*k2 + 2*k3 + k4 )/6;

    t = t + tau;

    sol(:,i) = [ t; u ];
    shift(i) = x_e(ampl, t, max);
    temp_fi(i) = fi(c, ampl, max);
    
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
%plot(sol(1,:), sol(2,:), 'b', time, deltaLenghtRubber, 'g', sol(1,:), fin, 'r')
%plot(time, deltaLenghtRubber, 'g', sol(1,:), shift, 'r', sol(1,:), fin)
plot(sol(1,:), sol(2,:), sol(1,:), temp_fi)
grid on
grid minor
    