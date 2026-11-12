# Lab 7 – Epipolar Geometry and Fundamental Matrix Estimation

## Overview
This laboratory studies the epipolar geometry of a stereo image pair and the estimation of the **fundamental matrix** from point correspondences. It also investigates the use of RANSAC to reject incorrect matches.

## Main Parts

### 1. Fundamental Matrix from Manual Correspondences
- Load the Rubik's Cube image pair and the corresponding manually selected points.
- Convert image points to homogeneous coordinates.
- Estimate the fundamental matrix using the normalized eight-point algorithm.
- Visualize the corresponding epipolar lines.

### 2. Robust Estimation with RANSAC
- Add randomly generated point pairs to introduce outliers.
- Estimate the fundamental matrix using RANSAC.
- Separate consensus points (inliers) from outliers and visualize the epipolar geometry.

### 3. Automatic Matching and RANSAC
- Extract and match image features using the image-matching code from Lab 6.
- Estimate the fundamental matrix from the automatically generated correspondences.
- Use RANSAC to identify a consistent set of matches.

## Main Files
- `Material/main.m` – runs the three parts of the laboratory.
- `Material/ransacF.m` – RANSAC estimation of the fundamental matrix.
- `Material/normalise2dpts.m` – normalization of homogeneous image points.
- `Material/visualizeEpipolarLines.m` – displays corresponding points and epipolar lines.
- `Material/imageMatching.m` – image matching routine used in the automatic-matching part.
- `Material/Mire/`, `Material/Rubik/` and `Material/OtherPairs/` – point correspondences and image pairs.

## How to Run
Open MATLAB, set the current folder to `Lab 7/Material/`, and run `main.m`. The third part adds the Lab 6 `ImageMatching` folder to the MATLAB path; verify the relative path if the folder layout is changed.

## Requirements
MATLAB and the image-processing/feature-matching functions used by the supplied implementation.

## Further Information
The supplied folder contains MATLAB source code and data files but no separate Lab 7 PDF instruction sheet.
