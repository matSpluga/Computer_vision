# Computer Vision – Assignment 4: Motion Analysis

## Project Overview

This assignment focuses on motion analysis in video sequences. It implements and compares background-based change detection methods, estimates optical flow using the **Lucas–Kanade algorithm**, and performs object segmentation and tracking.

The project is implemented in MATLAB and uses video sequences as input.

## Topics and Implemented Methods

1. **Change Detection with a Static Background**
   - Uses a reference frame as the background model.
   - Computes an absolute frame difference and thresholds it to obtain a binary foreground map.

2. **Change Detection with a Running Average**
   - Updates the background over time using a weighted running average.
   - Uses frame-to-frame differences to avoid updating pixels classified as moving.

3. **Optical Flow – Lucas–Kanade**
   - Computes spatial and temporal image derivatives.
   - Solves a local least-squares problem in a neighbourhood around each pixel.
   - Visualizes the estimated flow magnitude and direction.

4. **Segmentation and Tracking**
   - Extracts moving regions from the binary change-detection map.
   - Uses connected-component analysis and region properties.
   - Initializes a target manually and associates it in subsequent frames using the closest component centroid.

## Repository Structure

- `main.m` – main script with algorithm parameters and the selected execution part.
- `compareCDAlgo.m` – compares static-background and running-average change detection.
- `compareCDOF.m` – compares running-average change detection with optical flow.
- `LucasKanade.m` – local Lucas–Kanade optical-flow implementation.
- `convertToMagDir.m` – converts flow components into a magnitude/direction visualization.
- `segmentAndTrack.m` – performs motion segmentation and target tracking.
- `Spluga_Lab07/` – organized laboratory submission, including the report and MATLAB implementation.
- `CV_assignment4/` – an additional project copy containing example video files.

## Requirements

- MATLAB.
- Image Processing Toolbox and the video-reading/display functionality provided by MATLAB.
- The input video files required by the selected experiment.

## Input Videos

The scripts refer to the following video files:

- `luce_vp.mp4` – change-detection experiment.
- `tennis.mp4` – change detection versus optical-flow experiment.
- `DibrisHall.mp4` – segmentation and tracking experiment.

Place the videos in a folder named `Video` inside `Spluga_Lab07/` (as indicated by the original `Spluga_Lab07/Readme.txt`) and ensure that this folder is on the MATLAB path. The archive includes copies of these videos under `CV_assignment4/`; copy them into `Spluga_Lab07/Video/` if needed.

## How to Run

1. Extract the archive, preserving the directory structure.
2. Open MATLAB and set the current folder to `Spluga_Lab07/` (or to the folder containing the version you intend to run).
3. Ensure that the `Video/` folder contains the required videos.
4. Open `main.m` and select the experiment by uncommenting the corresponding section:
   - Part 1: `compareCDAlgo`
   - Part 2: `compareCDOF`
   - Part 3: `segmentAndTrack`
5. Run:

```matlab
main
```

The provided `main.m` currently enables Part 3 (segmentation and tracking), while Parts 1 and 2 are commented out. Adjust the script to run the other experiments.

## Parameters

The main script defines the following parameters:

| Parameter | Meaning |
|---|---|
| `tau1` | Foreground/change-detection threshold |
| `alpha` | Running-average update weight |
| `tau2` | Frame-to-frame motion threshold used to decide whether the background is updated |
| `W` | Lucas–Kanade neighbourhood window size |

## Notes

The tracking implementation initializes the target at a specific video frame and asks the user to select a point manually. The selected frame index and thresholds may need adjustment if a different video or version of the script is used.
