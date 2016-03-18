a_t = [a_min_t(1:29,:); [0 0]];
psi = [psi_min; 0];
for i=28:-1:1
    a_t = [a_t; a_max_t(i,:)];
    psi = [psi; psi_max(i)];
end


plot(a_t(:,1), psi, '*')