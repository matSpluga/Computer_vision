# Assignment 2 – NCC-Based Segmentation and Harris Corner Detection

## Project Overview

This assignment investigates two classical computer-vision techniques using MATLAB:

1. **Normalized Cross-Correlation (NCC)** for template-based object localization across an image sequence.
2. **Harris corner detection** for identifying interest points in an image.

The provided scripts apply these methods to car images and to the test image `i235.png`.

## Tasks and Implemented Methods

### 1. NCC-based template matching

A set of templates is selected from the first frame of a six-image street sequence. The script uses MATLAB's `normxcorr2` function to compute a normalized cross-correlation score map for each frame, then identifies a high-scoring region and displays a bounding box around the detected template.

The experiments include:
- A template around the red car.
- A template around the dark car turning left.
- Different template sizes for the dark car, to compare detection behaviour and computation time.

The lab instructions also request a qualitative comparison with the colour-based segmentation results from the previous lab; this comparison is intended for the report and is not implemented as part of this code submission.

### 2. Harris corner detection

The Harris detector is implemented step by step:
- Compute image derivatives along the horizontal and vertical directions using Sobel-like masks.
- Calculate the products of derivatives (`Ix²`, `Iy²`, and `IxIy`).
- Smooth these products with a Gaussian window.
- Construct the second-moment matrix and compute the Harris response:

  `R = det(M) - k * trace(M)^2`

- Threshold the response to identify candidate corner regions and use `regionprops` to estimate their centroids.
- Visualize the derivatives, Gaussian kernel, response map, candidate regions, and detected corners overlaid on the original image.

## Repository Structure

```text
assignment2/
├── README.md
├── Lab5.pdf                  # Lab instructions
├── main_1.m                  # NCC template matching
├── main_2.m                  # Harris corner detector
├── Copy_of_main_2.m          # Alternative Harris implementation/visualization
├── img/                      # Saved intermediate and result images
└── testimages/               # Input image sequence and test image
```

## Requirements

- MATLAB.
- Image Processing Toolbox (including `normxcorr2`, `regionprops`, `imread`, and image filtering functions).

## How to Run

1. Open MATLAB and set the current folder to `assignment2/`.
2. Run the NCC experiment:

   ```matlab
   main_1
   ```

3. Run the Harris corner detector:

   ```matlab
   main_2
   ```

The scripts use the `testimages/` folder through a relative path and generate figures for the matching results and corner-detection stages. `Copy_of_main_2.m` contains an alternative version of the Harris visualization and can be run separately if desired.

## Notes

See `Lab5.pdf` for the original assignment requirements. The NCC script evaluates the selected templates over the six supplied frames; the Harris scripts operate on `i235.png`. Detection thresholds and template coordinates are defined in the MATLAB files and can be adjusted for further experiments.
