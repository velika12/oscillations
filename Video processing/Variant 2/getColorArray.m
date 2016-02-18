function B = getColorArray( A, x, y, up_edge, down_edge )
B = uint8(zeros(size(A))); % matrix where we will write the result (it is created as double type)

for j = x(1) : x(2)
    for i = y(1) : y(2)
        c = 0;
        for k = 1:3
            % Searching for pixels whose colors are in our range
            if A(i,j,k) <= up_edge(k) && A(i,j,k) >= down_edge(k)
                c = c+1;
            else break
            end
        end
        % If color gets into our range over all 3 coordinates, we store
        % this pixel
        if c == 3
            B(i,j,:) = A(i,j,:);
        end
    end
end

end



