plot(time, midValueMCenteredYUp, time, y_up, time, y_down, time, y_down+(y_up-y_down)/2);
ax = gca;
ax.FontName = 'Times New Roman';
ax.FontSize = 12;
xlabel('t, s','FontName','Times New Roman','FontSize',14,'FontAngle','italic')
ylabel('x, m','FontName','Times New Roman','FontSize',14,'FontAngle','italic')
grid on
grid minor
