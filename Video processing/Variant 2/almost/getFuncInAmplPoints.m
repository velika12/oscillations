function y = getFuncInAmplPoints( time, ampl, func )

y = zeros(size(ampl,1), 1);
for i = 1:size(ampl,1)
    y(i)  = func(time == ampl(i,2));
end

end

