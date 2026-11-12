# Lab 5 – NCC-Based Segmentation and Harris Corner Detection

## Overview
This laboratory combines template-based object localization using normalized cross-correlation (NCC) with local feature detection using the Harris corner detector.

## Part 1 – NCC-Based Segmentation
- Select grayscale templates around the red car and the dark car from the first traffic-scene frame.
- Use normalized cross-correlation (`normxcorr2`) to locate each template in all six frames.
- Display each template, the maximum of the correlation score map and the corresponding bounding box.
- Compare NCC-based localization with the color-based segmentation developed in Lab 4 (the comparison is for the report).
- Evaluate three template-window sizes for the dark car, discussing computation time and detection accuracy.

## Part 2 – Harris Corner Detection
- Implement the Harris corner detector and apply it to `i235.png`.
- Display image partial derivatives and the Gaussian filter.
- Compute and visualize the Harris response map `R`.
- Extract corner regions using the suggested threshold of `0.3 * max(R)`.
- Use `regionprops()` to obtain corner-region centroids and overlay the detected corners on the input image.

## Repository Contents
- `Lab5.pdf` – laboratory instructions.
- `Lab5_testimages/` – `i235.png` and the six traffic-scene frames.

## Implementation Requirements
Use MATLAB M-files, relative paths, reusable functions and a main test script. The instructions also request a report containing the most relevant figures.

## Further Information
Refer to `Lab5.pdf` for the complete task description and report requirements.
