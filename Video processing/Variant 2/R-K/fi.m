function fi = fi( ampl )

c_osc = 3.0603; % N/m

if ampl == 0 % we consider these oscillations ideal
    fi = 0;
else
    psi = 0.09089*ampl^4 + 0.001478*ampl^3 + 0.2631*ampl^2 - 0.0001694*ampl - 0.0004234;
%     if max
%         fi = 2*( 0.1949*ampl^3 + 0.132*ampl^2 + 0.03143*ampl - 0.002599 ) / ( c*ampl^2 );
%     else
%         fi = 2*( -0.1949*ampl^3 + 0.132*ampl^2 - 0.03143*ampl - 0.002599 ) / ( c*ampl^2 );
%     end
    fi = 2*psi / ( c_osc*ampl^2 );
%    fi = 2*( 0.10172*ampl^4 + 0.001657*ampl^3 + 0.29424*ampl^2 - 0.00019105*ampl ) / ( c*ampl^2 );
end

end

