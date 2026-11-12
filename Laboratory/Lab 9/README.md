# Lab 9 – Optical Flow with the Lucas–Kanade Method

## Overview
This laboratory folder contains an implementation of the **Lucas–Kanade optical-flow algorithm** and scripts/data for testing motion estimation between consecutive image frames.

## Main Algorithm
`LucasKanade.m` estimates the horizontal and vertical optical-flow components (`u` and `v`) for each pixel:
- Compute spatial and temporal image derivatives.
- Extract a local window around each pixel.
- Build the least-squares system from the image gradients and temporal derivative.
- Estimate the local flow vector using the pseudoinverse.
- Replace undefined (`NaN`) flow values with zero.

The function requires two grayscale frames with matching dimensions and a selected local window size.

## Main Files
- `optical_flow/LucasKanade/LucasKanade.m` – Lucas–Kanade optical-flow implementation.
- `optical_flow/LucasKanade/TwoFramesLK.m` – loads two frames, computes optical flow and visualizes the vector field.
- `optical_flow/` – includes datasets and example sequences grouped by source/scene.

## Data
The `Data/` directory contains multiple sequences, including human-view and robot-view recordings, synthetic or object-focused sequences, and surveillance video data. Use the sequence appropriate to the experiment being performed.

## How to Run
1. Open MATLAB and add the `LucasKanade/` directory to the MATLAB path.
2. Call `TwoFramesLK(pathframe1, pathframe2, windowSize)` with the paths to two consecutive grayscale or RGB frames and an appropriate odd window size.
3. Inspect the displayed frames and optical-flow vector field.

## Requirements
MATLAB with image-processing functions used by the implementation, such as `rgb2gray`, `medfilt2` and image display utilities.

## Notes
No separate Lab 9 PDF instruction sheet is included in this archive. The README description is therefore based on the supplied MATLAB functions and directory contents.
