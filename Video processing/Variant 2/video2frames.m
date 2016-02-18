% Script for cutting videofile to frames
% Read the file
vid = VideoReader('.\Video02\In-data\2.avi');

%Read and write
k = 1;
while hasFrame(vid)
     frames = readFrame(vid);
     imwrite(frames,['.\Video02\In-data\Frames\img' int2str(k), '.jpg']);
     k = k + 1;
end