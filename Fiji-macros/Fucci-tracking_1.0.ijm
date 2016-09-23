// -------------------------------------------------------------------
// Written by: Patrice Mascalchi
// Date: 2014
// Location: Cancer Research Institute, University of Cambridge, UK
// -------------------------------------------------------------------

// Parameters to be modified by user
autopath = "C:\\Users\\Public\\Documents\\Siang\\Automation-Fucci\\";
// --------------------------------------------------------------------------------------------------------------

mainpath = File.openAsString(autopath + "channel.txt");
mainpath = substring(mainpath, 0, lengthOf(mainpath) - 2);

loopnb = File.openAsString(autopath + "loop-nb.txt");
loopnb = parseInt(loopnb);

files = getFileList(mainpath);
for (f = 0; f < files.length; f++) if (startsWith(files[f], "siang-fucci_xy" + IJ.pad(loopnb, 3) + "_") > 0) fname = files[f];

open(mainpath + File.separator + fname);
setLocation(100, 200, 1094, 1094);
//run("Delete Slice");

getDimensions(wi, he, ch, sl, fr);
if (fr==1) Stack.setDimensions(ch, fr, sl);  // swap sl and fr dimensions

run("TrackMate");

run("Brightness/Contrast...");
wait(2000);
if (isOpen("B&C")) {
     selectWindow("B&C");
     run("Close");
}