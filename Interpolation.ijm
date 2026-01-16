// Interpolates all ROIs in roiManager with 1 pixel interval
//Inputs = an ROI set opened in the ROI manager and a blank open  image to project the ROIs onto 
//outputs = an updated ROI manager 

n = roiManager("Count");

for (i = 0; i < n; i++) {
    roiManager("Select", i);
    run("Interpolate", "interval=1");
	roiManager("Update");
}


