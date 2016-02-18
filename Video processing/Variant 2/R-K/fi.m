function fi = fi( c, ampl, max )

if ampl == 0 % we consider these oscillations ideal
    fi = 0;
else
%     if max
%         fi = 2*( 0.1949*ampl^3 + 0.132*ampl^2 + 0.03143*ampl - 0.002599 ) / ( c*ampl^2 );
%     else
%         fi = 2*( -0.1949*ampl^3 + 0.132*ampl^2 - 0.03143*ampl - 0.002599 ) / ( c*ampl^2 );
%     end
    fi = 2*( 0.08245*ampl^4 + 0.008118*ampl^3 + 0.27*ampl^2 - 0.005896*ampl + 0.0003011 ) / ( c*ampl^2 );
end

end

