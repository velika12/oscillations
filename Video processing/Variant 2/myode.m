function dy = myode( t,y,m,T,ke_down,k_down,ke_up,k_up,et,e,lmbt,lmb )
lmb = interp1(lmbt,lmb,t);
e = interp1(et,e,t);

% if y(2) < 0
%     k = interp1(ke_down,k_down,e);
% else
%     k = interp1(ke_up,k_up,e);
% end

k = interp1(ke_up,k_up,e);

b = 2*m*lmb/T;
W = k/m;
D = b/m;

dy = zeros(2,1);
dy(1) = y(2);
dy(2) = -W*y(1);
%dy(2) = -W*y(1)-D*y(2);
%dy(2) = -W*y(1)-D*y(2)*abs(y(2))^2;
%dy(2) = -W*y(1)-D*sqrt(y(2));
%dy(2) = -W*y(1) - D*y(2)*abs(y(2));
%dy(2) = -W*y(1) - D*(y(2)^(3/2) - 6*y(2));
%dy(2) = -W*y(1) - D*y(2)^(3/2)+ 2*sign(y(2));
end

