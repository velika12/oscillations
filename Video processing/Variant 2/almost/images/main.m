clear

% Area we need to process
x = [100 1900];
y = [320 600];

% The first and the last frames
Nmin = 229;
Nmax = 2546;

% Upper color bound
cmp1 = [255 255 255];
% Lower color bound
cmp2 = [100 100 100];

% For percent calculation
p_temp = 0;
disp(['Status: ',num2str(p_temp),'%']);

% Time
time = 0:(Nmax - Nmin);
time = time .* (1/29.9701);

% Preallocate vectors
midValue = zeros(1, Nmax - Nmin + 1);

for num = Nmin:Nmax
    A = imread(['..\..\Video02\In-data\Frames\img' mat2str(num) '.jpg']);
    
    % Localizaton of the label in the picture
    B = getColorArray(A,x,y,cmp1,cmp2);
    
    % Writing into the file to see what we've got
    %imwrite(B, ['..\..\Video02\Out-data\ResultFrames\img' mat2str(num) '.jpg']);
    
    % If we already have resulting images, we put them into B
    %B = imread(['..\..\Video02\Out-data\ResultFrames\img' mat2str(num) '.jpg']);
    
    % Searching for the coordinate of center of mass on the label
    % Conveting to the gray colors (we need a 2-dim array)
    C = rgb2gray(B);
    % Find coordinates of all array values that are not equal to zero
    [r, c] = find(C);
    
    % Get the middle point as mean value over all not black points
%     midValue(num-Nmin+1) = mean(c);
%     medValue(num-Nmin+1) = median(c);
    
    min_ = min(c);
    max_ = max(c);
    
    midValue(num-Nmin+1) = min_ + 0.5*(max_-min_);

    % Percent
     p = (num - Nmin)*100/(Nmax-Nmin);
     if p_temp ~= floor(p/5)*5
        p_temp = floor(p/5)*5;
        disp(['Status: ',num2str(p_temp),'%']);
     end
end