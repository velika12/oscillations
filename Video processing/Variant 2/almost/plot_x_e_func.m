clear
load('only_rubber.mat')
tspan1 = 0:0.001:39; %s
tspan2 = 39.001:0.001:80;

shift1 = x_e(tspan1);
shift2 = 0.00030*tspan2 + 1.469;

plot(tspan1, shift1, 'b', tspan2, shift2, 'b', time, x1, 'g')

