function Ampl = getMinAmpl( y, time )

j = 1;
i = 2;
%Get all minimums, the second column is time
while i < size(y,1)
    if y(i) < y(i-1) && y(i) <= y(i+1) 
        c = 0;
        while y(i+c+1) == y(i)
            c = c + 1;
        end
        
        Ampl(j,1) = y( i + fix((c+1)/2) );
        Ampl(j,2) = time( i + fix((c+1)/2) );
        
        j = j + 1;
        i = i + c;
    end
    i = i + 1;
end

end

