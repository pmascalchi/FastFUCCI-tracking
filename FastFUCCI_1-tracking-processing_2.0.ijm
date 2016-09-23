// Written by Patrice Mascalchi, June 2016, CRUK Cambridge Institute - Bordeaux Imaging Center, University of Bordeaux
// Macro to split multi-channel timelapse images in single green and red videos.
// IMPORTANT: Works for 2- or more channels dataset, but GREEN expected in first channel and RED in second one!
// Required plugins (all included in Fiji package): Bio-Formats, Bleach Correction

// Pre-requisite: you have to check that image processing (background subtraction, shading correction, 
// optional bleach correction) is adapted to your timelapse videos. See code below for each channel...

// Parameters to be modified by user
mainpath = "E:\\Siang\\Exp59\\";		// directly containing images
format = ".czi";
// --------------------------------------------------------------------------------------------------------------


outG = mainpath + "green\\";
if (!File.exists(outG)) File.makeDirectory(outG);
outR = mainpath + "red\\";
if (!File.exists(outR)) File.makeDirectory(outR);

setBatchMode(true);

flist = SortFileList(mainpath, format);

for (f = 0; f < flist.length; f++) {
	outGname = "siang-fucci_xy" + IJ.pad(f+1,3) + "_green.tif";
	outRname = "siang-fucci_xy" + IJ.pad(f+1,3) + "_red.tif";

	run("Bio-Formats Importer", "open=[" + mainpath + flist[f] +"] color_mode=Grayscale split_channels view=Hyperstack stack_order=Default");
	wait(3000);					// pause to avoid opening errors
	closeWin(flist[f]+ " - C=2");	// close unused channel
	
	// GREEN channel
	selectWindow(flist[f]+ " - C=0");
	rename("green.tif");
	
		// Background subtraction and shading correction with minimum + Gaussian filter evaluation
	run("Duplicate...", "title=min.tif duplicate");
	run("Minimum...", "radius=30 stack");
	run("Gaussian Blur...", "sigma=50 stack");
	imageCalculator("Subtract stack", "green.tif", "min.tif");
	
		// Bleach correction due to auto-fluorescence of medium
	run("Bleach Correction", "correction=[Exponential Fit]");
	
	closeWin("y = a*exp(-bx) + c");
	closeWin("min.tif");
	
	saveAs("Tiff", outG + outGname);
	
	// RED channel
	selectWindow(flist[f]+ " - C=1");

		// Background subtraction with default ImageJ function (will have a shading correction effect as well)
	run("Subtract Background...", "rolling=50 stack");

	saveAs("Tiff", outR + outRname);
	
	run("Close All");
}

setBatchMode(false);
waitForUser("done!");

// ------------------------------------------------------------------------------------------
// --------------------------- functions ----------------------------------------------------

function SortFileList(path, filter) {		// Sort with endsWith
	flist = getFileList(path);
	OutAr = newArray(flist.length);
	ind = 0;
	for (f=0; f<flist.length; f++) {
		//print(flist[f] + " : "+endsWith(flist[f], filter));
		if (endsWith(flist[f], filter)) {
			OutAr[ind] = flist[f];
			ind++;
		}
	}
	return Array.trim(OutAr, ind);
}
// close any window without returning any error
function closeWin(name) {
	if (isOpen(name)) {
	     selectWindow(name);
	     run("Close");
	}
}