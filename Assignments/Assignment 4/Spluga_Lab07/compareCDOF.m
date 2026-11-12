function [] = compareCDOF(videoFile, tau1, alpha, tau2, W) 
% This function compares the output of the change detection algorithm based
% on a running average, and of the optical flow estimated with the
% Lucas-Kanade algorithm.
% You must visualize the original video, the background and binary map
% obtained with the change detection, the magnitude and direction of the
% optical flow.
% tau1 is the threshold for the change detection
% alpha is the parameter to weight the contribution of current image and
% previous background in the running average
% tau2 is the threshold for the image differencing in the running average
% W is the side of the square patch to compute the optical flow

% Create a VideoReader object
videoReader = VideoReader(videoFile);

%INITIALIZATION PART:
%First frame (initialized in order to immediately have a frame to use for
%the comparison inside the while). Here, the frame was chosen as a single
%image instead of an average of the first N frames for simplicity. 
firstFrame = readFrame(videoReader);
firstFrameGray = rgb2gray(firstFrame);

%Initialization of running average background:
running_bg = double(firstFrameGray);

prevGray = firstFrameGray;
prevFrameGray = firstFrameGray;

% Saving the handle of the figure:
hFigure = figure(1);

i = 0;

% Loop through each frame of the video
while hasFrame(videoReader)
    % Read the next frame
    frame = readFrame(videoReader);
    frameGray = rgb2gray(frame);

    % Display the frame
    figure(1), subplot(2, 2, 1), imshow(uint8(frame), 'Border', 'tight');
    title(sprintf('Frame %d', round(videoReader.CurrentTime * videoReader.FrameRate)));

    % Display the map of the optical flow
    % You can obtain the map by using the convertToMagDir function
    [u, v] = LucasKanade(prevGray, frameGray, W);
    rgbFlow = convertToMagDir(u, v);
    figure(1), subplot(2,2, 2), imshow(rgbFlow, 'Border', 'tight');
    title('Optical Flow');

    % Display of the running average
    figure(1), subplot(2, 3, 5), imshow(uint8(running_bg), 'Border', 'tight'); %the first shown image (as running background) is the first frame selected outside the while. Then it becomes the updated version described below.
    title('Running average');

    % Computation and display of the binary map obtained with the running average
    running_diff = abs(double(frameGray) - running_bg); %absolute value difference between each pixel of the 2 images.
    running_binary = running_diff > tau1; % tau1: detection threshold 
    
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

    prevGray = frameGray; 
    drawnow;

    i = i + 1;
    
    if ~isvalid(hFigure)
    disp('Playback interrupted by user.');
    break;
    end
end

fprintf('Finished displaying video: %s\n', videoFile);
end