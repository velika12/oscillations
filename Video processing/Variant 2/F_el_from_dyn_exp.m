m = 0.52; %kg
k = 18.88*10^(-4); %kg/m
% for i=2:2317;
%     v(i-1) = (midValueMCenteredYUp(i+1) - midValueMCenteredYUp(i-1))/(time(i+1)-time(i-1));
% end
% for i=2:2315
%     a(i-1) = (v(i+1)-v(i-1))/(time(i+1)-time(i-1));
% end
F_el = m*a + k*v(1:2316).^2.*sign(v(1:2316));
plot(midValueMCenteredYUp(1:2316), F_el, '.')
ax = gca;
ax.FontName = 'Times New Roman';
ax.FontSize = 12;
xlabel('x, m','FontName','Times New Roman','FontSize',14,'FontAngle','italic')
ylabel('F_{el}','FontName','Times New Roman','FontSize',14,'FontAngle','italic')
grid on
grid minor