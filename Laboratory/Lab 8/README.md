# Lab 8 – Stereo Vision and 3D Reconstruction

## Overview
This laboratory explores stereo vision, including disparity estimation from rectified image pairs and sparse 3D reconstruction from tracked image features.

## Part 1 – Disparity Estimation
The script `stereo_demo/script_disparity.m`:
- Loads a left/right stereo image pair from `stereo_pairs/`.
- Converts color images to grayscale when necessary.
- Displays the stereo pair in red-cyan format.
- Computes a disparity map using MATLAB's `disparitySGM`.
- Visualizes the disparity map, where brighter values represent points closer to the camera.

Several example stereo pairs are included. The active example in the script is the corridor pair, with a disparity range of `[-32 32]`.

## Part 2 – Sparse 3D Reconstruction
The script `stereo_demo/script_3D_sparse.m` demonstrates a sparse reconstruction pipeline:
- Load two images and camera parameters.
- Undistort the images.
- Detect feature points and track them between the two views.
- Estimate the essential matrix and identify epipolar inliers.
- Estimate the relative camera pose.
- Triangulate corresponding image points to obtain 3D points.

## Repository Contents
- `stereo_demo/script_disparity.m` – semi-global matching disparity example.
- `stereo_demo/script_3D_sparse.m` – sparse stereo reconstruction example.
- `stereo_pairs/` – stereo image pairs including corridor, dinosaur, parking-meter, RDS and shrub examples.

## Requirements
MATLAB with the relevant Computer Vision Toolbox functionality, including stereo disparity, feature detection/tracking, camera calibration and triangulation functions. The sparse demo also expects the MATLAB sample images and camera-parameter file referenced in the script.

## How to Run
Run the scripts from the `stereo_demo/` directory. For the disparity example, select the desired pair by editing the image-loading section of `script_disparity.m`. For sparse reconstruction, ensure that the MATLAB sample data and camera-parameter file are available.

## Notes
The sparse reconstruction script uses MATLAB toolbox sample data rather than the local `stereo_pairs/` images. The disparity script uses the local stereo pairs.
