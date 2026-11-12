function [] = segmentAndTrack(videoFile, tau1, alpha, tau2) 
% This function ...
% tau1 is the threshold for the change detection
% alpha is the parameter to weight the contribution of current image and
% previous background in the running average
% tau2 is the threshold for the image differencing in the running average
% Add here input parameters to control the tracking procedure if you need...

% Create a VideoReader object
videoReader = VideoReader(videoFile);

% Reading the first frame to initialize the running background
firstFrame = readFrame(videoReader);
firstGray  = rgb2gray(firstFrame);
running_bg = double(firstGray);
prevFrameGray = firstGray;

% Tracking state
targetInitialized = false;
traj = [];               % Nx2 array of (x,y) positions
lastPos = [];            % 1x2

% Visualization handle
hFigure = figure(1);

i = 0;

% I start from the frame I already read
frame = firstFrame;

% Loop through each frame of the video
while hasFrame(videoReader)
    % Read the next frame
    frame = readFrame(videoReader);
    frameGray = rgb2gray(frame);

    % Change detection vs running background
    Img_diff = abs(double(frameGray) - running_bg);
    binarymap = Img_diff > tau1;

    % Display the frame
    figure(1), imshow(uint8(frame), 'Border', 'tight');
    title(sprintf('Frame %d', round(videoReader.CurrentTime * videoReader.FrameRate)));

    hold on;

    % Update the running average and perform change detection

    
    if(i == 1380)
        pause;
        
        % In this frame there is a person wearing in white, this is the
        % target you must track
        % Pick a point manually on the person to initialize your trajectory

        % User clicks a point on the target
        [x0, y0] = ginput(1);
        lastPos = [x0, y0];
        traj = lastPos;
        targetInitialized = true; % After manually selecting the person, the program sets that person as the reference point in order to subsequently follow the target.

        plot(x0, y0, 'r+', 'MarkerSize', 10, 'LineWidth', 2);
        drawnow;


    elseif(i > 1380)

        % * Perform change detection and update the background model
        % * Identify the connected components in the binary map using the
        %   Matlab function bwconncomp
        % * Extract a description for each connected component using the
        %   Matlab function regionprops
        % * Now you have the positions of all connected components observed
        %   in the current frame and you can associate the target to its new
        %   position --> Append the new position to the trajectory

        % Connected components
        cc = bwconncomp(binarymap);

        if cc.NumObjects > 0 %number of connected components in the binary map
            stats = regionprops(cc, 'Centroid', 'Area', 'BoundingBox'); % In the struct array "stats" corresponding to the i-blob Centroid, area and boundingbox of the blob are calculated.

            % Collect centroids
            C = cat(1, stats.Centroid);   % Nx2 (N blobs and 2 coordinates x and y). This function vertically stacks the blobs centroids in the binary map.

            % Choose the closest centroid to last target position
            d2 = sum((C - lastPos).^2, 2); %d2 = square distance between i-blob and previous position
            [~, idxMin] = min(d2); % Here the closest blob position to the previous position

            newPos = C(idxMin, :); % newPos becomes the new centroid of the chosen blob (closest to previous position)

            % Append to trajectory
            traj = [traj; newPos]; % It contains all the trajectory points. Here I add the newPos as new row.
            lastPos = newPos; % Updating the position for the next frame.

            % Visualize tracking
            plot(traj(:,1), traj(:,2), 'r-', 'LineWidth', 2); %Visualization of the trajectory
            plot(newPos(1), newPos(2), 'ro', 'MarkerSize', 6, 'LineWidth', 2); %Visualization of the current target point

            % Drawing of a rectangular box around the chosen component
            bb = stats(idxMin).BoundingBox;
            rectangle('Position', bb, 'EdgeColor', 'r', 'LineWidth', 2);
        end

        drawnow;
    end

    hold off;

    % Update running average background (basic) 
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

    prevFrameGray = frameGray;
    drawnow;

     if ~isvalid(hFigure)
        disp('Playback interrupted by user.');
        break;
     end

    i = i + 1;

end

 % * At the end of the video, visualize the trajectory in the last
 %   frame

    if ~isempty(traj)
    figure, imshow(frame, 'Border','tight'); hold on;
    plot(traj(:,1), traj(:,2), 'r-', 'LineWidth', 2);
    plot(traj(end,1), traj(end,2), 'ro', 'MarkerSize', 6, 'LineWidth', 2);
    title('Final trajectory');
    hold off;
end
% Close the figure when playback is finished
close all;

fprintf('Finished displaying video: %s\n', videoFile);
end