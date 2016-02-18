
m = 0.52;
k = 0.5;
b = 0.05;

Y0 = [5 0];
tspan = [0 80];
[T,Y] = ode45(@(t,y) dmp(t,y,k,m,b), tspan, Y0);
