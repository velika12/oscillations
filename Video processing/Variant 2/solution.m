A0 = 120;
%beta = 0.03;
beta = 0.1;
Wa = 2.5;
fi = 0;
a = 0;
%co = A0 * 2./(time.^0.5).*cos(Wa*time + fi);
co = 0.4.*(5.6996*10^(-6)*(time+a).^4-0.0012138*(time+a).^3+0.10336*(time+a).^2-4.6555*(time+a)+261.06).*cos(Wa*time + fi);
%co = A0 * 3./((time+2).^0.6);
%co = A0*sin(Wa*T + fi);
plot(time, midValueCm, time,co,'g')
%plot(time,co)