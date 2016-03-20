% needs to be executed from main script

% all sigma_(smth) are standard (mean-square) errors

sigma_l_sm = 0.5; % sm
sigma_l_px = 3; % px, is used when smth is got from the picture by me
sigma_scale = scale * sqrt( ( sigma_l_sm / l_sm )^2 + ( sigma_l_px / l_px )^2 ); % m/px

sigma_midValue = 13; % px, radius of lamp

sigma_midValueM = midValueM .* sqrt( ( sigma_midValue ./ midValue ).^2 + ( sigma_scale / scale )^2 );

sigma_L0 = 0.5 * 10^(-2); % m
sigma_L1 = 0.5 * 10^(-2); % m

sigma_L2 = L2 * sqrt( ( sigma_l_px / L2_px )^2 + ( sigma_scale / scale )^2 ); % m

sigma_dL = sqrt( sigma_L1^2 + sigma_L2^2 ); % m

sigma_h = h * sqrt( ( sigma_l_px / h_px )^2 + ( sigma_scale / scale )^2 ); % m

sigma_deltaLengthRubber = sqrt( sigma_midValueM.^2 + sigma_dL^2 + sigma_h^2 + sigma_L0^2 ); % m

% figure
% subplot(2,1,1);
% plot(time, deltaLengthRubber, time, deltaLengthRubber - sigma_deltaLengthRubber, '-.', time, deltaLengthRubber + sigma_deltaLengthRubber, '-.')
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

figure
plot(time, y_e, 'g', time, y_e - sigma_y_e, '-.', time, y_e + sigma_y_e, '-.', time, shift)




