% needs to be executed from main script

% all sigma_(smth) are standard (mean-square) errors

sigma_tau = 0.017; % s, tau is time step in video (tau = 1/29.9701) and sigma is half of it
sigma_m = 0.001; % kg, consider mass accuracy 1 gramm

sigma_l_sm = 0.5; % sm
sigma_l_px = 3; % px, is used when smth is got from the picture by me
sigma_scale = scale * sqrt( ( sigma_l_sm / l_sm )^2 + ( sigma_l_px / l_px )^2 ); % m/px

sigma_midValue = 13; % px, radius of lamp

sigma_midValueM = midValueM .* sqrt( ( sigma_midValue ./ midValue ).^2 + ( sigma_scale / scale )^2 );

sigma_L0 = 0.5 * 10^(-2); % m

% TODO: measure more accurate!!!!!!!!!!!!
sigma_S = 3 * 10^(-6); % m

sigma_L1 = 0.5 * 10^(-2); % m

sigma_L2 = L2 * sqrt( ( sigma_l_px / L2_px )^2 + ( sigma_scale / scale )^2 ); % m

sigma_dL = sqrt( sigma_L1^2 + sigma_L2^2 ); % m

sigma_h = h * sqrt( ( sigma_l_px / h_px )^2 + ( sigma_scale / scale )^2 ); % m

sigma_deltaLengthRubber = sqrt( sigma_midValueM.^2 + sigma_dL^2 + sigma_h^2 + sigma_L0^2 ); % m

% TODO: plot errors correctly!!!!!!!!!!!!!!
% figure
% subplot(2,1,1);
% plot(time, deltaLengthRubber, time - sigma_tau, deltaLengthRubber - sigma_deltaLengthRubber, '-.', time + sigma_tau, deltaLengthRubber - sigma_deltaLengthRubber, '-.', time - sigma_tau, deltaLengthRubber + sigma_deltaLengthRubber, '-.', time + sigma_tau, deltaLengthRubber + sigma_deltaLengthRubber, '-.')
% subplot(2,1,2);
% plot(time, sigma_deltaLengthRubber)

min_sigma_deltaLengthRubber = min(sigma_deltaLengthRubber);
max_sigma_deltaLengthRubber = max(sigma_deltaLengthRubber);

sigma_y_up = max_sigma_deltaLengthRubber;
sigma_y_down = max_sigma_deltaLengthRubber;

sigma_y_e = 0.5*sqrt( sigma_y_up^2 + sigma_y_down^2 );

% Plot analytic function and compare it to the experiment data + errors
shift = zeros(1, size(time, 2));
for i = 1:size(time, 2);
    shift(i) = y_e_analytical(time(i));
end

% TODO: plot errors correctly!!!!!!!!!!!!!!
% figure
% plot(time, y_e, 'g', time - sigma_tau, y_e - sigma_y_e, '-.', time - sigma_tau, y_e + sigma_y_e, '-.', time, shift, time + sigma_tau, y_e - sigma_y_e, '-.', time + sigma_tau, y_e + sigma_y_e, '-.')

sigma_period = sigma_tau * sqrt(2 * ( size( A_max_t(:,2),1 ) + size( A_min_t(:,2),1 ) - 2 ));

sigma_w = 2*pi/period^2 * sigma_period;

sigma_c_osc = w * sqrt( sigma_m^2 + (2*m*sigma_w)^2 );

sigma_E = E * sqrt( (sigma_L0 / L0)^2 + ( sigma_c_osc / c_osc )^2 + (sigma_S / S)^2 );

% Get sigma of new ampls a_max, a_min
sigma_A_max = getFuncInAmplPoints(time, A_max_t, sigma_deltaLengthRubber);
sigma_A_min = getFuncInAmplPoints(time, A_min_t, sigma_deltaLengthRubber);

sigma_a_max = sqrt( sigma_A_max.^2 + sigma_y_e^2 );
sigma_a_min = sqrt( sigma_A_min.^2 + sigma_y_e^2 );

sigma_eps_max = eps_max_t(:,1) .* sqrt( (sigma_a_max ./ a_max_t(:,1)).^2 + (sigma_L0 / L0)^2 );
sigma_eps_min = eps_min_t(:,1) .* sqrt( (sigma_a_min ./ a_min_t(:,1)).^2 + (sigma_L0 / L0)^2 );

sigma_psi_max = sqrt( 0.25 * ( eps_max_t(1:size(eps_max_t,1)-1, 1).^2 - eps_max_t(2:size(eps_max_t,1), 1).^2 ).^2 * sigma_E^2 + E^2 * ( eps_max_t(1:size(eps_max_t,1)-1, 1).^2 .* sigma_eps_max(1:size(sigma_eps_max,1)-1).^2 + eps_max_t(2:size(eps_max_t,1), 1).^2 .* sigma_eps_max(2:size(sigma_eps_max,1)).^2 ) );
sigma_psi_min = sqrt( 0.25 * ( eps_min_t(1:size(eps_min_t,1)-1, 1).^2 - eps_min_t(2:size(eps_min_t,1), 1).^2 ).^2 * sigma_E^2 + E^2 * ( eps_min_t(1:size(eps_min_t,1)-1, 1).^2 .* sigma_eps_min(1:size(sigma_eps_min,1)-1).^2 + eps_min_t(2:size(eps_min_t,1), 1).^2 .* sigma_eps_min(2:size(sigma_eps_min,1)).^2 ) );


% Place sigma_a_ in one vector
% sigma_a = [sigma_a_max(1:size(sigma_a_max,1)-1); sigma_a_min(1:size(sigma_a_min,1)-1)];

% Sigma for psi(a) for approximate formula
% sigma_psi_max = sqrt( a_max_t(1:size(a_max_t,1)-1, 1).^2 .* diff(a_max_t(:,1)).^2 * sigma_c_osc^2 + c_osc^2 * ( 2*a_max_t(1:size(a_max_t,1)-1, 1) - a_max_t(2:size(a_max_t,1), 1) ).^2 .* sigma_a_max(1:size(sigma_a_max,1)-1).^2 + c_osc^2 * a_max_t(1:size(a_max_t,1)-1, 1).^2 .* sigma_a_max(2:size(sigma_a_max,1)).^2 );
% sigma_psi_min = sqrt( a_min_t(1:size(a_min_t,1)-1, 1).^2 .* diff(a_min_t(:,1)).^2 * sigma_c_osc^2 + c_osc^2 * ( 2*a_min_t(1:size(a_min_t,1)-1, 1) - a_min_t(2:size(a_min_t,1), 1) ).^2 .* sigma_a_min(1:size(sigma_a_min,1)-1).^2 + c_osc^2 * a_min_t(1:size(a_min_t,1)-1, 1).^2 .* sigma_a_min(2:size(sigma_a_min,1)).^2 );

% Sigma for psi(a) for accurate formula
% sigma_psi_max = sqrt( 0.25 * ( a_max_t(1:size(a_max_t,1)-1, 1).^2 - a_max_t(2:size(a_max_t,1), 1).^2 ).^2 * sigma_c_osc^2 + c_osc^2 * ( a_max_t(1:size(a_max_t,1)-1, 1).^2 .* sigma_a_max(1:size(sigma_a_max,1)-1).^2 + a_max_t(2:size(a_max_t,1), 1).^2 .* sigma_a_max(2:size(sigma_a_max,1)).^2 ) );
% sigma_psi_min = sqrt( 0.25 * ( a_min_t(1:size(a_min_t,1)-1, 1).^2 - a_min_t(2:size(a_min_t,1), 1).^2 ).^2 * sigma_c_osc^2 + c_osc^2 * ( a_min_t(1:size(a_min_t,1)-1, 1).^2 .* sigma_a_min(1:size(sigma_a_min,1)-1).^2 + a_min_t(2:size(a_min_t,1), 1).^2 .* sigma_a_min(2:size(sigma_a_min,1)).^2 ) );

sigma_psi = [sigma_psi_max; sigma_psi_min];

figure
errorbar(eps_t(:,1), psi, sigma_psi, '*')



