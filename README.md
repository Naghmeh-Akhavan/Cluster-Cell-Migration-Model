
# Modeling of Collective Cell Migration 

This repository contains the code that describes the position of the border cell cluster during the migration through the *Drosophila Melanogaster* egg chamber. The details can be found on the paper *Chemotaxis of Drosophila Border Cells in Modulated by Tissue Geometry Through Dispersion of Chemoattractatns* by Alex George, Naghmeh Akhavan, Bradford E. Peercy, and Michelle Starz-Gaiano. The code is written in MATLAB R2022a by Naghmeh Akhavan.

## Usage

The parameter(s) of the model can be set in `initial_setup.m` You may run `main.m` file through MATLAB. This code will produce following plots:
- Figure 2B: Plot of the chemoattractant concentration gradient (Fitted model)
- Figure 2C: Plot of the tracking cluster speed with experimental data
- Figure 2F: Plot of cluster position with sensitivity analysis of the second intersection depth
- Figure 2G: Plot of cluster position in control domain two intersections vs control domain with a single cell
- Figure 2H: Plot of speed of cluster with sensitivity analysis of the second intersection depth
- Figure 3F: Plot of the cluster speed in the control domain (Fitted model) and overexpression chemoattractant concentration
- Figure 3G: Plot of the position of center of cluster in the control domain (Fitted model) and overexpression chemoattractant concentration
- Figure 5F : Plot of the cluster trajectory in the control domain (fitted model) for two intersections, single intersection, and single intersection with 3X increaed the volume
- Figure 5G: Plot of cluster trajectory for two intersection+overexpression, single intersection+overexpression+3X volume, and single intersection+overexpression
- Figure S2: Plot of chemoattracttant concentration with respect to the position of center of cluster

## Parameters

The following parameters might be set:
```
x0       Center of the first intersection
x4       Center of the second intersection
xhat0    Half length of the first intersection
xhat4    Half length of the second intersection
b0       First intersection depth
b4       Second intersection depth
sigma    Chemoattractant secretion rate
rb       Radius of the cluster
```

## Details of the Figures

Following figures are presented in the paper "Tissue Geometry Modulates Chemoattractant Distribution to Direct Drosophila Border Cell Migration Behaviors"

To replicate the results shown in the Figures below, you need to adjust the parameters as follows:

- Figure 2B: in `initial_setup.m` file, no changes. Save and run `figure(4)` in `main.m` file.
- Figure 2C: in `initial_setup.m` file, no changes. Save and run `figure(2)` in `main.m` file.
- Figure 2F: in `initial_setup.m` file, change the depth of first and second intersection parameter `b0, b4`as below
  - `b0=0.25, b4=0.66` (black),
  - `b0=0.25, b4=0.86` (dashed red)
  - `b0=0.25, b4=0.46` (dashed green)
  - `b0=b4=0.18` (dark red)
  - `b0=0.25, b4=0.18` (orange).
For each trajectory save and run `figure(1)` in `main.m` file.
- Figure 2G: in `initial_setup.m` file, no changes. Save and run `figure(1)` in `main.m` file (black). in `initial_setup.m` file, the radius of cluster `r=3`. Save and run `figure(1)` in `main.m` file (magenta). 
- Figure 2H: in `initial_setup.m` file, change the depth of first and second intersection parameter `b0, b4`as below
  - `b0=0.25, b4=0.66` (black),
  - `b0=0.25, b4=0.86` (dashed red)
  - `b0=0.25, b4=0.46` (dashed green)
  - `b0=b4=0.18` (dark red)
  - `b0=0.25, b4=0.18` (orange). 
For each trajectory save and run `figure(2)` in `main.m` file.
- Figure 3F: Run the base parameters for fitted model. Hold on. In `concentration.m` file, change the secretion rate, `s=1/A`, to `s=2*1/A`. Save and run `figure(2)` in `main.m` file.
- Figure 3G: Run the base parameters for fitted model. Hold on. In `concentration.m` file, change the secretion rate, `s=1/A`, to `s=2*1/A`. Save and run `figure(1)` in `main.m` file.
- Figure 5F: in `initial_setup.m` file, no changes. Save and run `figure(1)` in `main.m` file (black).
  - in `initial_setup.m` file, change the depth of first interstection parameter `b0=0.18`, change the position of second intersection `x4=80` and length of the second intersection `xhat4=10`. Save and run `figure(1)` in `main.m` file (dashed blue).
  - in `initial_setup.m` file, change the depth of first interstection parameter `b0=0.18`, change the position of second intersection `x4=80` and length of the second intersection `xhat4=10`. change `d.perc=0.44`. Save and run `figure(1)` in `main.m` file (dashed cyan).
- Figure 5G:  in `initial_setup.m` file, no changes. in `concentration.m` file, change the secretion rate `s=2*1/A`.  Save and run `figure(1)` in `main.m` file (green).
  - in `initial_setup.m` file, change the depth of first interstection parameter `b0=0.18`, change the position of second intersection `x4=80` and length of the second intersection `xhat4=10`, and `d.perc=0.44`. In `concentration.m` file, change the secretion rate `s=2*1/A`.  Save and run `figure(1)` in `main.m` file (dashed red).
  - in `initial_setup.m` file, change the depth of first interstection parameter `b0=0.18`, change the position of second intersection `x4=80` and length of the second intersection `xhat4=10`. In `concentration.m` file, change the secretion rate `s=2*1/A`.  Save and run `figure(1)` in `main.m` file (dashed magenta).
-  Figure S2: in `initial_setup.m` file, no changes. Save and run `figure(3)` in `main.m` file.  
## 

## Numerical Solution of Chemoattractant Concentration
The numerical solution of chemoattractant concentration is solved by `pdepe` in `NumericalSolutionConcentration.m` file. The details of the solution can be found in the paper and supplementary of paper.

## Contact
For any questions, please contact Naghmeh Akhavan (Email: nakhava1@umbc.edu) or Dr. Bradford E. Peercy (Email: bpeercy@umbc.edu)


