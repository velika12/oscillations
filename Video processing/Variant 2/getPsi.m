m = 0.52; % kg
g = 9.815; % N/kg
c = 3.4231; % N/m, the same as k

%psi = -c*A_t(1:29,1).*diff(A_t(:,1)); % for max peaks
%psi = -c*A2_t(1:28,1).*diff(A2_t(:,1)); % for min peaks
%plot(A_t(1:29,1),psi,'-*');
%plot(A2_t(1:28,1),psi,'-*');

% psi = c*max_t(1:28,1).*abs(diff(max_t(:,1))); % for man peaks delta rubber
% plot(max_t(1:28,1),psi,'-*');

% psi = c*min_t(1:29,1).*abs(diff(min_t(:,1))); % for min peaks delta rubber
% plot(min_t(1:29,1),psi,'-*');

%psi_min = c*abs(ampls_min(1:29,1).*diff(ampls_min));

psi_max = -c*a_max_t(1:28,1).*diff(a_max_t(:,1));
psi_min = -c*a_min_t(1:29,1).*diff(a_min_t(:,1));

%plot(ampls_min(1:29,1),psi_min,'-*', ampls_max(1:28,1),psi_max,'-*');
plot(a_max_t(1:28,1), psi_max, '-*', a_min_t(1:29,1), psi_min, '-*')

ax = gca;
ax.FontName = 'Times New Roman';
ax.FontSize = 12;
xlabel('A, m','FontName','Times New Roman','FontSize',14,'FontAngle','italic')
ylabel('\psi, J','FontName','Times New Roman','FontSize',14,'FontAngle','italic')
grid on
grid minor