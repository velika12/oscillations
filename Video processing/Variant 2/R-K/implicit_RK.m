clear
m = 0.52; % kg
g = 9.815; % N/kg
k = 3.7437; % N/m
w = sqrt(k/m); % 1/s

tau = 0.001; % step

% initial value (t=0) for rubber delta
u0 = [0.207840823387164; 0.170783137448452];

tspan = [1.067730838402274; 70]; %s

ampl = 0; % amplitude of the cycle, m
max = false;
eps = 0.001; % difference for ampl

% Matrix to save solution
sol = zeros(3,1);
sol(:,1) = [ tspan(1); u0 ];

u = u0;
u1 = [0; 0];
t = tspan(1);
i = 1; % index of solution column

% while t < tspan(2); 
%     i = i + 1;
%     
%     u1(2) = ( u(2) + tau*g - w*w*tau*u(1) ) / ( 1 + w*fi(k, ampl, max)*tau*0.5/pi + w*w*tau*tau );
%     u1(1) = u(1) + tau*u1(2);
% 
%     t = t + tau;
% 
%     sol(:,i) = [ t; u1 ];
%     
%     u = u1;
%     
%     if sol(3,i-1)*sol(3,i) < 0
%         max = ~max;
%         ampl = sol(2,i);
%     end
%     
% end

%Euler
j = 0; % how many cycles we've passed?
while t < tspan(2)   
    i = i + 1;

    u1(2) = ( u(2) + tau*g - w*w*tau*u(1) ) / ( 1 + w*fi(k, ampl, max)*tau*0.5/pi + w*w*tau*tau );
    u1(1) = u(1) + tau*u1(2);
    
    t = t + tau;

    sol(:,i) = [ t; u1 ];
    
    u = u1;

    if sol(3,i-1)*sol(3,i) < 0
        j = j + 0.5;
        if j - fix(j) == 0 % check we passed the whole cycle, not the half
            ampl = sol(2,i);
        end
    end
end

load('only_rubber.mat')
figure(1)
plot(sol(1,:), sol(2,:), 'b', time, deltaLenghtRubber, 'g')
grid on
grid minor