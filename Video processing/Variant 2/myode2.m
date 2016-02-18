function dy = myode2( t,y,m,ke_down,k_down,ke_up,k_up )

ro = 1.18; % kg/m3 = g/cm3, at 25 C
S = 0.0032; % m2

e = (y(1)+1.87)/0.49;
if y(2) < 0
    k = interp1(ke_down,k_down,e); % N/m
else
    k = interp1(ke_up,k_up,e); % N/m
end

W = k/m;%*1.875; % 1/c^2
F = sign(y(2))*0.5*ro*y(2)^2*S;
rub = 3*10^(-3);

dy = zeros(2,1);
dy(1) = y(2);
dy(2) = -W*y(1);
%dy(2) = -W*y(1) - F/m;

end

