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

subplot(2,1,2);
plot(time, sigma_deltaLengthRubber)
