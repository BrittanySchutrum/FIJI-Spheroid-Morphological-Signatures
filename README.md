# FIJI-Spheroid-Morphological-Signatures
FIJI macros as featured in the manuscript Shape Factor Screening to Quantify Morphological Signatures of Spheroid/Organoid Malignancy and Invasiveness

## Description 
Image J Macros in this repository 
1) **ConvexityMacro.ijm** = calculates the convexity (the convex perimeter divided by the perimeter) for each ROI open in the ROI manager 
2) **perimeter_points.ijm** = counts the number of perimeter points defining an ROI. Useful in preparing ROIs for radial length analysis in MATLAB
3) **interpolation.ijm** = creates additional perimeter points to define an ROI by interpolating to a 1 pixel interval. Useful for preparing ROIs for radial length analysis in MATLAB

## Installation 
.ijm files can be downloaded and opened directly in FIJI/ImageJ

## Convexity Background and Usage 
Convexity is a dimensionless shape factor that is defined by the convex perimeter divided by the original shape perimeter. Convex hull is a function in FIJI that makes a selected region convex.

### ConvexityMacro.ijm
**Inputs:** ROI set (or single ROI)

**Outputs:**  
1. ROIs of the convex hulls for each ROI 
2. A table containing the perimeters, convex perimeters, and convexity measurements for each ROI 

![Convexity Demo](ConvexityDemoImage.png)

## Perimeter Pointa and Interpolation 
### Background and useage 
Radial length analysis (RLA) of spheroids in MATLAB as described in the repository AverageRadialLength-Spheroids is dependent on the coordinates of points which define the perimeter of an ROI created in FIJI. By default, the shape is defined by the minimum number of points to define the shape in FIJI, however for RLA applications it is desirable to interpolate the perimeter points to maximize the number of defined points. 

### Perimeter_points.ijm
**Inputs:**
1. ROI set
2. A blank image to project the ROIs onto. NOTE: this must be of sufficient pixel dimensions to fit your ROIs. To create, in FIJI go to File > New Image  and specify dimensions. 

**Output:**  log listing each ROI and the corresponding number of perimeter points

### Interpolation.ijm
**Inputs:**
1. ROI set
2. A blank image to project the ROIs onto. NOTE: this must be of sufficient pixel dimensions to fit your ROIs. To create, in FIJI go to File > New Image  and specify dimensions. 

**Output:** updated ROI manager with each ROI interpolated to a 1-pixel interval. 
