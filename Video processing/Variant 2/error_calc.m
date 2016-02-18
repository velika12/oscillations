% Error calculation
l_0_stat = 5.3 * 10^(-2); % m
dl_0_stat = 0.5 * 10^(-2); % m

l_0_din = 49 * 10^(-2); % m
dl_0_din = 3 * 10^(-2); % m

dm = 0.2 * 10^(-3); % kg

ddx = 0.5 * 10^(-2); % m

err_k1 = error_k(dm,m,ddx,dx1cm,dl_0_stat,l_0_stat,dl_0_din,l_0_din);

err_k2 = error_k(dm,m(1:19),ddx,dx2cm,dl_0_stat,l_0_stat,dl_0_din,l_0_din);

% Creating plot
plot(eps1,err_k1,'-*',eps2, err_k2,'-x')
legend({'растяжение','сжатие'},'FontName','Times New Roman','FontSize',12)
ax = gca;
ax.FontName = 'Times New Roman';
ax.FontSize = 12;
xlabel('\epsilon','FontName','Times New Roman','FontSize',14,'FontAngle','italic')
ylabel('\epsilon_k','FontName','Times New Roman','FontSize',14,'FontAngle','italic')
grid on
grid minor