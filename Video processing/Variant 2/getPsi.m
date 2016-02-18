m = 0.52; % kg
g = 9.815; % N/kg
c = 3.0603; % N/m, the same as k

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