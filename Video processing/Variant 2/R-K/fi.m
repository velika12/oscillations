function fi = fi( c, ampl, max )

if ampl == 0 % we consider these oscillations ideal
    fi = 0;
else
    if max
        %fi = 2*( 0.2678*a^3 + 0.03101*a^2 + 0.06533*a - 0.01374 ) / ( c*a^2 );
        fi = 2*( 0.218*ampl^3 + 0.1477*ampl^2 + 0.03516*ampl - 0.002908 ) / ( c*ampl^2 );
    else
        %fi = 2*( -0.219*a^3 + 0.2511*a^2 - 0.04937*a + 0.0006464 ) / ( c*a^2 );
        fi = 2*( -0.218*ampl^3 + 0.1477*ampl^2 - 0.03516*ampl - 0.002908 ) / ( c*ampl^2 );
    end
end

end

