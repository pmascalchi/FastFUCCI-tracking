// -------------------------------------------------------------------
// Written by: Patrice Mascalchi
// Date: 2014-2016
// Location: Cancer Research Institute, University of Cambridge, UK
// -------------------------------------------------------------------

// Parameters to be modified by user // use double backslash or appropriate characters as separator (depending on OS)
autopath = "C:\\Users\\Public\\Documents\\Siang\\Automation-Fucci\\";
// --------------------------------------------------------------------------------------------------------------

loopnb = File.openAsString(autopath + "loop-nb.txt");
loopnb = parseInt(loopnb);

mainpath = File.openAsString(autopath + "channel.txt");
mp = split(mainpath, "\n");
mainpath = mp[0];

if (isOpen("TrackMate capture")==0) exit("no capture found");
selectWindow("TrackMate capture");
run("AVI... ", "compression=JPEG frame=15 save=[" + mainpath + "TrackMate_xy" + IJ.pad(loopnb, 3) + ".avi]");
wait(1000);
close;

// WRITING next loop-nb.txt FILE
if (File.exists(autopath+"loop-nb.txt")) File.delete(autopath+"loop-nb.txt");
wait(200);
File.saveString(loopnb+1, autopath + "loop-nb.txt");
wait(200);
run("Quit");
