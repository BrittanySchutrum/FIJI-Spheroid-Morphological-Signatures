// Quantifies the convexity of ROIs in roiManager and outputs one table "Convexity Measurements"
// Calculated convexity values appear in the Convexity Measurements table 
// Convexity = convex perimeter / perimeter

//inputs = a FIJI ROI set 

// Closing results window if it is currently open 
if (isOpen("Results")) {
    selectWindow("Results");
    run("Close");
}
//set measurements to be collected using the measurement function 
run("Set Measurements...", "area perimeter shape display redirect=None decimal=2"); // need perimeter 

// Initializing variables
n = roiManager("Count");
perimArray1 = newArray(n); //collect ROI perimeters
perimArray2 = newArray(n); //collect convex perimeters
nameArray = newArray(n); //ROI names or labels 
convexityArray = newArray(n);

// Generating convex hulls for each ROI
for (i = 0; i < n; i++) {
    roiManager("Select", i);
    run("Convex Hull"); // creates convex hull for the ROIs
    roiManager("Add"); // adds convex ROIs to the end of list in the roiManager
}

// Measuring the perimeter of all ROIs (the original ROIs and thier convex hulls)
for (i = 0; i < n * 2; i++) {
    roiManager("Select", i);
    run("Measure"); // Creating results table
}

// Getting real and convex perimeters
for (i = 0; i < n; i++) {
    roiManager("Select", i);
	nameArray[i] = Roi.getName();
    perimArray1[i] = getResult("Perim.", i); // orginal ROI perimeter
}

for (i = n; i < n * 2; i++) {
    roiManager("Select", i);
    perimArray2[i - n] = getResult("Perim.", i); // convex perimeter
}

// Calculating convexity
for (i = 0; i < n; i++) {
    convexityArray[i] = perimArray2[i] / perimArray1[i];  // convexity = convex perimeter / perimeter
}

// Create output table
Table.create("Convexity Measurements");
Table.setColumn("ROI", nameArray);
Table.setColumn("ROI Perimeter", perimArray1);
Table.setColumn("Convex Perimeter", perimArray2);
Table.setColumn("Convexity", convexityArray);
// position table on screen
Table.setLocationAndSize(100, 100, 800, 800);

// Closing redundant results window  
if (isOpen("Results")) {
    selectWindow("Results");
    run("Close");