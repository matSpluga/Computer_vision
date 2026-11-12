# Lab 6 – Image Matching

## Overview
This laboratory implements and evaluates feature-based image matching between two images. The provided MATLAB code detects local features, extracts descriptors and establishes correspondences using different similarity criteria.

## Main Files
- `ImageMatching/Labo_matching.m` – main example script; loads an image pair, selects a matching method and displays the matches.
- `ImageMatching/findMatches.m` – detects FAST keypoints, extracts SURF descriptors, builds an affinity matrix and computes matches.
- `ImageMatching/similarity.m` – evaluates the similarity between candidate feature pairs.
- `ImageMatching/show_matches.m` – visualizes the resulting correspondences.
- `ImageMatching/images/` – example image pairs and Rubik's Cube images.

## Matching Options
The example script documents four matching modes:
- `POS` – position-based similarity.
- `NCC` – normalized cross-correlation similarity.
- `POSNCC` – combined position and NCC similarity.
- `POSSURF` – combined position and SURF-descriptor similarity.

The script also exposes a matching threshold, an optional SVD flag and a spatial scale parameter (`sigma`).

## How to Run
1. Open MATLAB and set the current folder to `Lab 6/ImageMatching/`.
2. Open `Labo_matching.m`.
3. Select the desired matching method and parameters.
4. Run the script to display detected correspondences.

## Requirements
The implementation uses MATLAB image-processing and feature-extraction functions, including FAST feature detection and SURF feature descriptors. Availability of the required Computer Vision Toolbox functions may depend on the MATLAB installation.

## Notes
The example script uses relative paths to the `images/` folder. Run it from the `ImageMatching` directory or adjust the paths accordingly.
