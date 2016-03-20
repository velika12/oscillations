clear
load('images/imagesResult2points.mat') % there are data in px from images and time

global m c g L0

m = 0.52; % kg
c = 3.437; % N/m
g = 9.815; % N/kg

l_sm = 111;
l_px = 811;
scale = l_sm/l_px * 10^(-2); % m/px, scaling coeff to get coordinates in meters

midValueM = midValue * scale; % get coordinates in meters

L0 = 0.49; % m, length of rubber without deformation
L1 = 1.58; % m, length from the suspension to the lower side of the sconce
L2_px = 649; % px, length from the upper side of frame to the sconce
L2 = L2_px * scale; % m
dL = L1 - L2; % m, length of rubber that is outside frame
h_px = 177; % px, length of the bottle + half of the lamp (old - label)
h = h_px * scale; % m

deltaLengthRubber = midValueM + dL - h - L0; % m, value of rubber's absolute deformation

% Get max and min ampl from experimantal data
A_max_t = getMaxAmpl(deltaLengthRubber, time);
A_min_t = getMinAmpl(deltaLengthRubber, time);

% Delete wrong points (they appear for middle-2-points algorithm, not for mean)
A_max_t(22,:) = [];
A_max_t(22,:) = [];
A_max_t(29,:) = [];
A_min_t(22,:) = [];
A_min_t(23,:) = [];

figure
plot(A_max_t(:,2), A_max_t(:,1), 'x')
figure
plot(A_min_t(:,2), A_min_t(:,1), 'x')

% Calculate the period from experimental data
period = ( sum( diff( A_max_t(:,2) ) ) + sum( diff( A_min_t(:,2) ) ) ) / ( size( A_max_t(:,2),1 ) + size( A_min_t(:,2),1 ) - 2 );

% Plot the envelopes
z_up = (time - 38.51)/22.08;
y_up = 0.002617*z_up.^6 - 0.006079*z_up.^5 + 0.003604*z_up.^4 - 0.01684*z_up.^3 + 0.07681*z_up.^2 - 0.1868*z_up + 1.741;

z_down = (time - 38.51)/22.82;
y_down = - 0.006876*z_down.^6 + 0.01224*z_down.^5 + 0.001477*z_down.^4 + 0.02063*z_down.^3 - 0.1057*z_down.^2 + 0.2223*z_down + 1.219;

% Find function of equilibrium position
y_e = 0.5*( y_up + y_down );

% figure
% plot(time, y_up, time, y_down, time, y_e)



errors % calculate and plot errors














