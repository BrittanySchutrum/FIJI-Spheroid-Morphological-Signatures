// Counts number of perimeter points of ROIs in roiManager
//Inputs = an ROI set opened in the ROI manager and a blank open  image to project the ROIs onto
//Outputs= log listing each ROI and the corresponding number of perimeter points

// Get number of ROIs in the ROI Manager
roiManager("select", newArray());  // deselect all
n = roiManager("count");

for (i = 0; i < n; i++) {
    // Select each ROI
    roiManager("select", i);

    // Get coordinates of the current ROI
    getSelectionCoordinates(xPoints, yPoints);
    numPoints = lengthOf(xPoints);

    // Print info
    print(Roi.getName() + ": " + numPoints + " points");
}