function dy = dmp( t,y,k,m,b )
W = k/m;
D = b/m;
dy = zeros(2,1);
dy(1) = y(2);
dy(2) = -W*y(1);
%dy(2) = -W*y(1)-D*y(2);
%dy(2) = -W*y(1)-D*y(2)*abs(y(2))^2;
end

