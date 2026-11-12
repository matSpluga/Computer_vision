# Lab 10 – Kalman Filtering for Tracking and Mobile-Robot Localization

## Overview
This folder contains MATLAB examples of Kalman filtering applied to two problems: tracking an image feature using position and optical-flow measurements, and estimating a mobile robot's position from noisy motion and wall-distance measurements.

## 1. Feature Tracking with Optical Flow
`lecture8_Kalman_Filter/example_Kalman_tracking_withof.m`:
- Loads the tracking data from `data_track.mat`.
- Uses manually labelled feature coordinates and optical-flow measurements.
- Introduces an intentionally incorrect coordinate measurement to simulate a tracking error.
- Defines a constant-velocity state-transition model.
- Performs the Kalman prediction and correction steps.
- Visualizes measured and filtered feature positions.

The state contains image position and velocity components. The measurement model uses the feature coordinates, while the example constructs the measurement vector using optical-flow values.

## 2. Mobile-Robot Localization
`lecture8_Kalman_Filter/rob_kal.m` implements a Kalman-filter example for a mobile robot:
- Simulates robot motion with process noise.
- Generates noisy distance measurements relative to two walls.
- Builds the measurement matrix from the wall equations.
- Computes the innovation, Kalman gain and corrected state estimate.
- Stores the state estimates, covariance matrices and normalized innovation squared (NIS) values.

The function is called as `rob_kal(a1,b1,a2,b2)`, where the two pairs of coefficients define the wall equations.

## Main Files
- `lecture8_Kalman_Filter/example_Kalman_tracking_withof.m` – feature tracking using position and optical flow.
- `lecture8_Kalman_Filter/rob_kal.m` – mobile-robot localization example.
- `lecture8_Kalman_Filter/data_track.mat` – data used by the feature-tracking example.

## How to Run
Set the MATLAB current folder to `lecture8_Kalman_Filter/`. Run `example_Kalman_tracking_withof.m` for the tracking example. To run the robot-localization example, call `rob_kal(a1,b1,a2,b2)` with the desired wall coefficients.

## Requirements
MATLAB. The feature-tracking example expects the variables used by the script to be present in `data_track.mat`.

## Notes
The examples use fixed model and noise parameters in the source code. Change them only when investigating the effect of process noise, measurement noise or model assumptions.
