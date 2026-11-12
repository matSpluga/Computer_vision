# Assignment 1 – Image Filtering and Fourier Transform

## Project Overview

This assignment explores image degradation, spatial filtering, image sharpening, and frequency-domain analysis using MATLAB. The experiments start from a grayscale test image, add synthetic noise, compare denoising filters, and examine how filtering operations affect the Fourier spectrum.

## Tasks and Implemented Methods

### 1. Noise generation
- Add Gaussian noise with standard deviation 20.
- Add salt-and-pepper noise with density 20%.
- Display the original and noisy images together with their histograms.

### 2. Image smoothing
Compare three denoising approaches using two spatial supports (3×3 and 7×7):
- Moving-average (box) filtering.
- Gaussian low-pass filtering.
- Median filtering.

The script displays the filter kernels and the filtered results to illustrate the effect of kernel size and filter type.

### 3. Linear-filter practice
Implement sharpening and image translation using 7×7 spatial filters. The sharpening operation is demonstrated both as a convolution with a sharpening kernel and as an unsharp-mask-style operation based on subtracting a smoothed image and adding the detail component back to the original.

### 4. Fourier Transform
Use the 2-D Fast Fourier Transform (`fft2`) to inspect the magnitude spectrum of the input and filtered images. The magnitude is shifted to the centre and displayed on a logarithmic scale. The assignment also examines the frequency response of a 101×101 Gaussian low-pass filter (σ = 5) and a 7×7 sharpening filter embedded in a larger zero-padded array.

## Repository Structure

```text
assignment1/
├── README.md
├── Assignment1.pdf       # Lab instructions
├── main.m                # Main MATLAB script
└── testimages/
    ├── tree.png
    └── i235.png
```

## Requirements

- MATLAB.
- Image Processing Toolbox (for functions such as `imread`, `imfilter`, `fspecial`, `medfilt2`, and `imhist`).

## How to Run

1. Open MATLAB and set the current folder to `assignment1/`.
2. Run the main script:

   ```matlab
   main
   ```

The script adds the `testimages/` directory to the MATLAB path using a relative path and opens figures showing the images, kernels, histograms, and Fourier magnitude spectra.

## Notes

The script is intended to reproduce the experiments described in `Assignment1.pdf`. Some parameter choices and intermediate results are defined directly in `main.m`; modify them there to explore different noise levels, filter sizes, or filter parameters.
