# Lab 2 – Image Filtering and Fourier Transform

## Overview
This laboratory investigates spatial-domain image filtering and frequency-domain analysis using the Fourier Transform.

## Main Tasks
1. Add Gaussian noise (standard deviation 20) and salt-and-pepper noise (density 20%) to the provided images, and display the noisy images and their histograms.
2. Reduce noise using:
   - Moving-average filtering
   - Low-pass Gaussian filtering
   - Median filtering
3. Compare filters with spatial supports of **3×3** and **7×7** pixels.
4. Implement the linear-filter exercises specified in the lecture slides, using 7×7 supports.
5. Apply the 2D FFT and display the logarithmic magnitude spectrum of the images.
6. Display the frequency-domain magnitude of a 101×101 Gaussian low-pass filter (σ = 5) and of the specified sharpening filter.

## Repository Contents
- `Lab2.pdf` – laboratory instructions.
- `Lab2_testimages/` – test images (`i235.png`, `tree.png`).

## Implementation Requirements
Use MATLAB M-files, relative paths, reusable functions and a main script to test the work. The original lab instructions also request a report with relevant figures.

## How to Run
Run the main MATLAB script for the lab after implementing the filtering and FFT functions and checking that the test-image paths are correct.

## Further Information
Refer to `Lab2.pdf` for the full task specifications and report requirements.
