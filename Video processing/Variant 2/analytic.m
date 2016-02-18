m = 0.52; %kg

Y0 = [1.177159176612836 -0.170783137448454]; %m, m/s
tspan = [1.067730838402274 80]; %s
[T,Y] = ode45(@(t,y) myode2(t,y,m,eps2(4:19),k2(3:18),eps1(2:21),k1), tspan, Y0);
plot(time,midValueMCenteredYUp, T, Y(:,1))
legend({'Эксперимент','Математическая модель'},'FontName','Times New Roman','FontSize',12)
ax = gca;
ax.FontName = 'Times New Roman';
ax.FontSize = 12;
xlabel('t, s','FontName','Times New Roman','FontSize',14,'FontAngle','italic')
ylabel('x, m','FontName','Times New Roman','FontSize',14,'FontAngle','italic')
grid on
grid minor