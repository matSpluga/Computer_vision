# Lab 4 – Color-Based Segmentation and Blob Detection

## Overview
This laboratory explores color-based object segmentation using RGB and HSV representations, followed by multi-scale blob detection.

## Part 1 – Color-Based Segmentation
- Display the six traffic-scene images in grayscale.
- Split each image into RGB and HSV channels.
- Examine the RGB components and Hue values of the dark car turning left.
- Select a region of interest in the first frame and calculate the mean and standard deviation of its Hue values.
- Segment the dark car across all six frames using a Hue threshold, for example `m ± s`.
- Use `regionprops()` to extract the centroid and bounding box of the largest segmented blob.
- Repeat the analysis for the red car, considering the Hue range near 1 as indicated in the instructions.

## Part 2 – Blob Detection
- Compute Laplacian responses for the two highlighted sunflowers at multiple scales.
- Estimate the characteristic scale of each selected object.
- Use the suggested scale parameters: initial standard deviation 1, ten scales and a multiplicative scale increment of 1.5.

## Repository Contents
- `Lab4.pdf` – laboratory instructions.
- `Lab4_testimages/` – six traffic-scene frames and `sunflowers.png`.

## MATLAB Notes
The instructions recommend using logical masks with `regionprops()` and displaying the detected centroid and bounding box over the original color images.

## Further Information
Refer to `Lab4.pdf` for the specified regions of interest, example results and complete instructions.
