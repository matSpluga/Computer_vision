# Computer Vision – Assignment 3: Stereopsis and Image Matching

## Project Overview

This assignment explores two-view geometry and feature correspondence in stereo image pairs. The main objectives are to estimate the **fundamental matrix** using the Eight-Point Algorithm, evaluate epipolar geometry, and identify matching points between images.

The implementation is developed in MATLAB and is accompanied by example image pairs, point correspondences, and a laboratory report.

## Topics and Implemented Methods

- **Eight-Point Algorithm:** estimation of the fundamental matrix from point correspondences.
- **Normalized Eight-Point Algorithm:** normalization of image coordinates to improve numerical conditioning.
- **Epipolar geometry:** visualization of epipolar lines, computation of epipoles, and verification of the epipolar constraint.
- **RANSAC:** robust estimation of the fundamental matrix in the presence of outliers.
- **Image matching:** extraction of local keypoints and matching based on patch similarity (including NCC/POSNCC-based approaches).
- **Similarity analysis:** construction and analysis of a similarity matrix, including an SVD-based refinement.

## Repository Structure

The archive contains several versions and supporting materials for the laboratory:

- `Spluga_Lab06/` – main submitted implementation and report.
  - `main.m` – runs the fundamental-matrix estimation, RANSAC, and image-matching workflow.
  - `Include/` – helper functions for the eight-point algorithms, epipoles, epipolar constraint, and RANSAC.
  - `Spluga_Lab06.pdf` – laboratory report.
- `Material/` – supporting MATLAB files and example datasets, including image pairs and point files.
- `CV_Assignment3_Samu/` – an additional implementation/version of the assignment.
- `Immagini report/` – figures used in the report.

## Requirements

- MATLAB (the report was prepared using MATLAB R2023b).
- Image Processing Toolbox for image-processing functions used by the scripts.
- The helper functions and image/data folders must be available on the MATLAB path.

## How to Run

1. Extract the archive while preserving its folder structure.
2. Open MATLAB and set the current folder to `Spluga_Lab06/`.
3. Ensure the required data folders are available in the expected relative locations. The original `Spluga_Lab06/Readme.txt` notes that the `Rubik`, `Mire`, and `OtherPairs` image folders need to be placed inside `Spluga_Lab06/`. The archive also contains example data under `Material/` and other project folders.
4. If using the `ImageMatching` material, add that folder to the MATLAB path and check the `delta` patch parameter in `findMatches.m` (the original note specifies a value of `10`).
5. Run:

```matlab
main
```

The script is organized into three parts: manual point correspondences, RANSAC-based estimation, and automatic image matching followed by RANSAC.

## Main Results

The workflow produces:
- Fundamental matrices estimated with and without coordinate normalization.
- Epipolar-line visualizations for the two image views.
- Epipoles and epipolar-constraint checks.
- RANSAC consensus sets and outlier rejection.
- Feature correspondences and their visualizations for the selected image pair.

For a detailed explanation of the methodology, parameter choices, experiments, and results, see `Spluga_Lab06/Spluga_Lab06.pdf`.

## Notes

Some folders contain alternative or supporting versions of the same laboratory code. Check the relative paths in `main.m` before running it, especially if you choose a folder other than `Spluga_Lab06/`.
