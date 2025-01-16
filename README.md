
# Modeling of Collective Cell Migration 

This repository contains the code that describes the position of the border cell cluster during the migration through the *Drosophila Melanogaster* egg chamber. The details can be found in the paper *"Chemotaxis of Drosophila Border Cells in Modulated by Tissue Geometry Through Dispersion of Chemoattractants"* by Alex George, Naghmeh Akhavan, Bradford E. Peercy, and Michelle Starz-Gaiano. The code is written in MATLAB R2022a by Naghmeh Akhavan.

## Usage

The parameter(s) of the model can be set in `initial_setup.m` You may run `main.m` file through MATLAB. This code will produce the following plots:
- Figure 2B: Plot of the chemoattractant concentration gradient (Fitted model)
- Figure 2C: Plot of the tracking cluster speed with experimental data
- Figure 2F: Plot of cluster position with sensitivity analysis of the second intersection depth
- Figure 2G: Plot of cluster position in control domain two intersections vs control domain with a single cell
- Figure 2H: Plot of speed of cluster with sensitivity analysis of the second intersection depth
- Figure 3F: Plot of the cluster speed in the control domain (Fitted model) and overexpression chemoattractant concentration
- Figure 3G: Plot of the position of the center of the cluster in the control domain (Fitted model) and overexpression chemoattractant concentration
- Figure 5F: Plot of the cluster trajectory in the control domain (fitted model) for two intersections, single intersection, and single intersection with 3X increased volume
- Figure 5G: Plot of cluster trajectory for two intersection+overexpression, single intersection+overexpression+3X volume, and single intersection+overexpression
- Figure S2: Plot of chemoattractant concentration with respect to the position of the center of the cluster

## Parameters

The following parameters might be set:
```
x0       Center of the first intersection
x4       Center of the second intersection
xhat0    Half the length of the first intersection
xhat4    Half the length of the second intersection
b0       First intersection depth
b4       Second intersection depth
s=1/A    Chemoattractant secretion rate
r        Radius of the cluster
```

## Details of the Figures

The following figures are presented in the paper *"Chemotaxis of Drosophila Border Cells in Modulated by Tissue Geometry Through Dispersion of Chemoattractants"*.

To replicate the results shown in the Figures below, you need to adjust the parameters as follows:

- Figure 2B: in `initial_setup.m` file, no changes. Save and run `figure(4)` in `main.m` file.
- Figure 2C: in `initial_setup.m` file, no changes. Save and run `figure(2)` in `main.m` file.
- Figure 2F: in `initial_setup.m` file, change the depth of the first and second intersection parameters `b0, b4`as below
  - `b0=0.25, b4=0.66` (black),
  - `b0=0.25, b4=0.86` (dashed red)
  - `b0=0.25, b4=0.46` (dashed green)
  - `b0=b4=0.18` (dark red)
  - `b0=0.25, b4=0.18` (orange).
For each trajectory save and run `figure(1)` in `main.m` file.
- Figure 2G: in `initial_setup.m` file, no changes. Save and run `figure(1)` in `main.m` file (black). in `initial_setup.m` file, the radius of cluster `r=3`. Save and run `figure(1)` in `main.m` file (magenta). 
- Figure 2H: in `initial_setup.m` file, change the depth of the first and second intersection parameters `b0, b4`as below
  - `b0=0.25, b4=0.66` (black),
  - `b0=0.25, b4=0.86` (dashed red)
  - `b0=0.25, b4=0.46` (dashed green)
  - `b0=b4=0.18` (dark red)
  - `b0=0.25, b4=0.18` (orange). 
For each trajectory save and run `figure(2)` in `main.m` file.
- Figure 3F: Run the base parameters for the fitted model. Hold on. In `concentration.m` file, change the secretion rate, `s=1/A`, to `s=2*1/A`. Save and run `figure(2)` in `main.m` file.
- Figure 3G: Run the base parameters for the fitted model. Hold on. In `concentration.m` file, change the secretion rate, `s=1/A`, to `s=2*1/A`. Save and run `figure(1)` in `main.m` file.
- Figure 5F: in `initial_setup.m` file, no changes. Save and run `figure(1)` in `main.m` file (black).
  - in `initial_setup.m` file, change the depth of the first interstection parameter `b0=0.18`, change the position of second intersection `x4=80` and length of the second intersection `xhat4=10`. Save and run `figure(1)` in `main.m` file (dashed blue).
  - in `initial_setup.m` file, change the depth of the first interstection parameter `b0=0.18`, change the position of second intersection `x4=80` and length of the second intersection `xhat4=10`. change `d.perc=0.44`. Save and run `figure(1)` in `main.m` file (dashed cyan).
- Figure 5G:  in `initial_setup.m` file, no changes. in `concentration.m` file, change the secretion rate `s=2*1/A`.  Save and run `figure(1)` in `main.m` file (green).
  - in `initial_setup.m` file, change the depth of the first interstection parameter `b0=0.18`, change the position of the second intersection `x4=80` and length of the second intersection `xhat4=10`, and `d.perc=0.44`. In `concentration.m` file, change the secretion rate `s=2*1/A`.  Save and run `figure(1)` in `main.m` file (dashed red).
  - in `initial_setup.m` file, change the depth of the first interstection parameter `b0=0.18`, change the position of the second intersection `x4=80` and the length of the second intersection `xhat4=10`. In `concentration.m` file, change the secretion rate `s=2*1/A`.  Save and run `figure(1)` in `main.m` file (dashed magenta).
-  Figure S2: in `initial_setup.m` file, no changes. Save and run `figure(3)` in `main.m` file.  
## 

## Numerical Solution of Chemoattractant Concentration
The numerical solution of chemoattractant concentration is solved by *pdepe* in `NumericalSolutionConcentration.m` file. The details of the solution can be found in the paper and supplementary paper.

## Contact
For any questions, please contact Naghmeh Akhavan (Email: nakhava1@umbc.edu) or Dr. Bradford E. Peercy (Email: bpeercy@umbc.edu)


