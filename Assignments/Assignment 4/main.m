addpath('Video');

%% Motion Analysis Assignment
clear;
clc;
close all;

% PARAMETERS 
tau1  = 25;    % threshold for foreground detection
alpha = 0.05;  % running average update parameter
tau2  = 15;    % threshold for motion detection
W = 7;         % side of the square patch to compute the optical flow

% PART 1: CDALGO
%videoFile_CD = 'luce_vp.mp4';
%compareCDAlgo(videoFile_CD, tau1, alpha, tau2);
%disp('Finished Part 1 - Change Detection');

% PART 2: CDOF
%videoFile_OF = 'tennis.mp4';
%compareCDOF(videoFile_OF, tau1, alpha, tau2, W);
%disp('Finished Part 2 - Change Detection vs Optical Flow');

% PART 3: SEGMENTATION & TRACKING
videoFile_TR = 'DibrisHall.mp4';
segmentAndTrack(videoFile_TR, tau1, alpha, tau2);
disp('Finished Part 3 - Segmentation and Tracking');
