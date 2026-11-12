function [] = compareCDAlgo(videoFile, tau1, alpha, tau2) 
% This function compares the output of the change detection algorithm when
% using two possible background models:
% 1. A static model, e.g. a single frame or the average of N frames.
% In this case, the background is computed once and for all
% 2. A running average to update the model. In this case the background is
% updated, if needed, at each time instant
% You must visualize the original video, the background and binary map
% obtained with 1., the background and binary map
% obtained with 2.
% tau1 is the threshold for the change detection
% alpha is the parameter to weight the contribution of current image and
% previous background in the running average
% tau2 is the threshold for the image differencing in the running average

% Create a VideoReader object
videoReader = VideoReader(videoFile);

%INITIALIZATION PART:
%First frame (initialized in order to immediately have a frame to use for
%the comparison inside the while). Here, the frame was chosen as a single
%image instead of an average of the first N frames for simplicity. 
firstFrame = readFrame(videoReader);
firstFrameGray = rgb2gray(firstFrame);

%Initialization of static background:
static_bg = firstFrameGray;

%Initialization of running average background:
running_bg = double(firstFrameGray);

prevFrameGray = firstFrameGray;

% Saving the handle of the figure:
hFigure = figure(1);

% Loop through each frame of the video
while hasFrame(videoReader)
    % Read the next frame
    frame = readFrame(videoReader);
    frameGray = rgb2gray(frame);

    % Display the frame
    figure(1), subplot(2, 3, 1), imshow(uint8(frame), 'Border', 'tight');
    title(sprintf('Frame %d', round(videoReader.CurrentTime * videoReader.FrameRate)));

    % Display the static background
    figure(1), subplot(2, 3, 2), imshow(uint8(static_bg), 'Border', 'tight');
    title('Static background');

    % Computation and display of the binary map obtained with the static background
    static_diff = abs(double(frameGray) - double(static_bg)); %absolute value difference between each pixel of the 2 images.
    static_binary = static_diff > tau1; %tau1 decides how much a single pixel has changed between images. If the difference is small (<tau1) it's not considered as motion (probably noise).
    
    figure(1), subplot(2, 3, 3), imshow(static_binary, 'Border', 'tight');
    title('Binary map 1');

    % Display of the running average
    figure(1), subplot(2, 3, 5), imshow(uint8(running_bg), 'Border', 'tight'); %the first shown image (as running background) is the first frame selected outside the while. Then it becomes the updated version described below.
    title('Running average');

    % Computation and display of the binary map obtained with the running average
    running_diff = abs(double(frameGray) - running_bg); %absolute value difference between each pixel of the 2 images.
    running_binary = running_diff > tau1;   % tau1: detection threshold  
    
    % Here I decide if it is necessary to update the running_bg values or
    % not basing on the static or movement conditions of the pixels between
    % the background and the current frame.
    for y = 1:size(frameGray,1)
        for x = 1:size(frameGray,2)
            Dt = abs(double(frameGray(y,x)) - double(prevFrameGray(y,x))); % here I implement the binary map Dt(x,y) which compares the images at time t and t-1.
            % Motion mask
            if Dt <= tau2  % tau2: update threshold
                % Static pixel → updating the background
                running_bg(y,x) = alpha * double(frameGray(y,x)) + ...
                              (1 - alpha) * running_bg(y,x); %updating the running_bg value with a weighted average if the pixel is static (if the pixel is moving I don't do nothing). 
            end
            % else: moving pixel → I do nothing
        end
    end
    
    figure(1), subplot(2, 3, 6), imshow(running_binary, 'Border', 'tight'); 
    title('Binary map 2');

    prevFrameGray = frameGray;
    drawnow;

    if ~isvalid(hFigure)
    disp('Playback interrupted by user.');
    break;
    end
end

% Close the figure when playback is finished
close all;

fprintf('Finished displaying video: %s\n', videoFile); 
end