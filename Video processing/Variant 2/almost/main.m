clear
load('images/imagesResult2points.mat') % there are data in px from images and time

% Transform strings to vectors
midValue = midValue';
time = time';

global m c c_osc g w L0

m = 0.52; % kg
c = 3.437; % N/m
g = 9.815; % N/kg

l_sm = 111;
l_px = 811;
scale = l_sm/l_px * 10^(-2); % m/px, scaling coeff to get coordinates in meters

midValueM = midValue * scale; % get coordinates in meters

L0 = 0.49; % m, length of rubber without deformation

% TODO: measure more accurate!!!!!!!!!!
S = 6 * 10^(-6); % m2, area of rubber's cross section

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

% figure
% plot(A_max_t(:,2), A_max_t(:,1), 'x', time, deltaLengthRubber)
% figure
% plot(A_min_t(:,2), A_min_t(:,1), 'x', time, deltaLengthRubber)

% Calculate period, frequency, c_osc and Young's modulus from experimental data
period = ( sum( diff( A_max_t(:,2) ) ) + sum( diff( A_min_t(:,2) ) ) ) / ( size( A_max_t(:,2),1 ) + size( A_min_t(:,2),1 ) - 2 );
w = 2*pi/period;
c_osc = m * w^2;
E = L0*c_osc/S; % Young's modulus for material

% Plot the envelopes
z_up = (time - 38.51)/22.08;
y_up = 0.002617*z_up.^6 - 0.006079*z_up.^5 + 0.003604*z_up.^4 - 0.01684*z_up.^3 + 0.07681*z_up.^2 - 0.1868*z_up + 1.741;

z_down = (time - 38.51)/22.82;
y_down = - 0.006876*z_down.^6 + 0.01224*z_down.^5 + 0.001477*z_down.^4 + 0.02063*z_down.^3 - 0.1057*z_down.^2 + 0.2223*z_down + 1.219;

% Find function of equilibrium position
y_e = 0.5*( y_up + y_down );

% figure
% plot(time, y_up, time, y_down, time, y_e)

% Recalculate ampl points in relation to the y_e values
y_e_in_max_t = getFuncInAmplPoints(time, A_max_t, y_e);
y_e_in_min_t = getFuncInAmplPoints(time, A_min_t, y_e);

a_max_t = [A_max_t(:,1)-y_e_in_max_t, A_max_t(:,2)];
a_min_t = [A_min_t(:,1)-y_e_in_min_t, A_min_t(:,2)];

eps_max_t = [a_max_t(:,1)/L0, a_max_t(:,2)];
eps_min_t = [a_min_t(:,1)/L0, a_min_t(:,2)];

% figure
% plot(A_max_t(:,2), y_e_in_max_t, 'x', A_min_t(:,2), y_e_in_min_t, 'x', A_max_t(:,2), A_max_t(:,1), 'x', A_min_t(:,2), A_min_t(:,1), 'x')

% Get psi function and plot it
% psi_max = -c_osc*a_max_t(1:size(a_max_t)-1,1).*diff(a_max_t(:,1));
% psi_min = -c_osc*a_min_t(1:size(a_min_t)-1,1).*diff(a_min_t(:,1));

psi_max = 0.5 * E / L0^2 * ( a_max_t(1:size(a_max_t)-1,1).^2 - a_max_t(2:size(a_max_t),1).^2 );
psi_min = 0.5 * E / L0^2 * ( a_min_t(1:size(a_min_t)-1,1).^2 - a_min_t(2:size(a_min_t),1).^2 );

psi = [psi_max; psi_min];

eps_t = [eps_max_t(1:size(eps_max_t,1)-1,:); eps_min_t(1:size(eps_min_t,1)-1,:)];

% a_t = [a_max_t(1:size(a_max_t,1)-1,:); a_min_t(1:size(a_min_t,1)-1,:)];

% figure
% plot(eps_t(:,1), psi, '*')

errors % calculate and plot errors

% explicit_RK














