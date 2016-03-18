function Ampl = getMaxAmpl( y, time )
%Get first max if it is necessary
% Ampl(1,1)=y(1);
% Ampl(1,2)=time(1);
% j = 2;
j = 1;

%Get all maximums except the initial (initial deviation), the second column is time
for i=2:size(y,2)-1
    if(y(i)>y(i-1)&&y(i)>=y(i+1))
        Ampl(j,1)=y(i);
        Ampl(j,2)=time(i);
        j=j+1;
    end
end

end

