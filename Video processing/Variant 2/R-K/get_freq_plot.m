load('only_rubber.mat')
w_max = 2*pi./diff(max_t(:,2));
w_min = 2*pi./diff(min_t(:,2));

%plot(x1_max(1:28), w_max, 'b', x1_min(1:29), w_min, 'r')
% plot(w_max, '-* b')
% hold on
% plot(w_min, '-* r')

j = 1;
k = 1;
for i=1:2316
    if v(i) > 0 && v(i+1) < 0
        acc_max_t(j) = ( time(i) + time(i+1) )*0.5;
        j = j + 1;
    end
    if v(i) < 0 && v(i+1) > 0
        acc_min_t(k) = ( time(i) + time(i+1) )*0.5;
        k = k + 1;
    end
end

w_acc_max = 2*pi./diff(acc_max_t);

plot(w_acc_max, 'g')
figure(2) 
plot(w_max, 'b')
%plot(max_t(:,2), 'b')
%plot(min_t(:,2))