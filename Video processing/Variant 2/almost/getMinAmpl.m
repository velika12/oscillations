function Ampl = getMinAmpl( y, time )

j = 1;

%Get all minimums, the second column is time
for i=2:size(y,2)-1
    if(y(i)<y(i-1)&&y(i)<=y(i+1))
        Ampl(j,1)=y(i);
        Ampl(j,2)=time(i);
        j=j+1;
    end
end

end

