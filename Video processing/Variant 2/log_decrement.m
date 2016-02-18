% Experimental result analysis
A_t = getAmpl(midValueMCenteredYUp,time);
A = A_t(:,1);
size(A',2)
for i = 1:size(A',2)-1;
    lambda(i) = log((A(i)+1.425)/(A(i+1)+1.425)); %if we don't put the graph higher, we'll get complex result
end

%Computation result analysis
% A = A2_t(:,1);
% for i = 1:size(A',2)-1
%     lambda2(i) = log(A(i)/A(i+1));
% end