# Lab 3 – Edge Detection and Hough Transform

## Overview
This laboratory covers edge detection using the Laplacian of Gaussian (LoG) operator and straight-line detection using the Hough Transform.

## Main Tasks

### Laplacian of Gaussian
- Implement a MATLAB function that generates LoG filters.
- Visualize filters with different spatial supports and standard deviations, including σ = 1 and σ = 3.5.
- Convolve `boccadasse.jpg` with the generated filters.
- Detect zero-crossings by scanning image rows and columns.
- Apply a threshold to the slope at zero-crossings and compare the results with MATLAB's `edge(...,'log',...)` function.

### Hough Transform
- Detect straight lines in `highway1.jpg` and `highway2.jpg`.
- Use the suggested Hough peak settings: four peaks for `highway1.jpg`, and five peaks with `NHoodSize` set to `[21 21]` for `highway2.jpg`.

## Repository Contents
- `Lab3.pdf` – laboratory instructions.
- `Lab3_testimages/` – `boccadasse.jpg`, `highway1.jpg` and `highway2.jpg`.

## Implementation Requirements
Implement the processing in MATLAB functions and provide a script to test the algorithms. Use relative file paths.

## Further Information
Refer to `Lab3.pdf` for the full instructions and suggested parameter settings.
