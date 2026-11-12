# Lab 1 – Image Warping and Bilinear Interpolation

## Overview
This laboratory explores image warping using a coordinate transformation. Given a mapping from output coordinates to source-image coordinates, the goal is to generate a transformed image by sampling the source image.

## Main Tasks
- Implement **backward image warping**, mapping each output pixel to a location in the input image.
- Implement **bilinear interpolation** to estimate image intensity values at non-integer source coordinates.
- Apply geometric transformations such as translation and rotation, experimenting with different rotation angles.
- Use the transformation data provided in `data.mat` to warp the supplied test images.

## Repository Contents
- `Lab1.pdf` – laboratory instructions.
- `Lab1_data/` – input images (`boccadasse.jpg`, `flower.jpg`) and transformation data (`data.mat`).

## Implementation Requirements
The laboratory instructions require MATLAB M-files, reusable functions, relative paths and a main script that tests the implementation.

## How to Run
Create or open the MATLAB main test script, set the current folder to this lab directory, and run the script after ensuring that image and data paths are relative to the project folder.

## Further Information
Refer to `Lab1.pdf` for the complete exercise description and figures.
