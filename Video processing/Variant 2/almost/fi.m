function fi = fi( ampl )

c_osc = 3.0603; % N/m

if ampl == 0 % we consider these oscillations ideal
    fi = 0;
else
    psi = 0.09089*ampl^4 + 0.001478*ampl^3 + 0.2631*ampl^2 - 0.0001694*ampl;% - 0.0004234;
    
    fi = 2*psi / ( c_osc*ampl^2 );
end

end

