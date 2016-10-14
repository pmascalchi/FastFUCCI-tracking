// -------------------------------------------------------------------
// Written by: Patrice Mascalchi
// Date: 2014-2016
// Location: Cancer Research Institute, University of Cambridge, UK
// -------------------------------------------------------------------

// Parameters to be modified by user // use double backslash or appropriate characters as separator (depending on OS)
autopath = "C:\\Users\\Public\\Documents\\Siang\\Automation-Fucci\\";
chpath = "C:\\Users\\Public\\Documents\\Siang\\green\\"; // set the path for red OR green channel
// --------------------------------------------------------------------------------------------------------------

if (File.exists(autopath+"loop-nb.txt")) File.delete(autopath+"loop-nb.txt");

// WRITING next loop-nb.txt FILE
File.saveString("1", autopath+"loop-nb.txt");

if (File.exists(autopath+"channel.txt")) File.delete(autopath+"channel.txt");

// WRITING next loop-nb.txt FILE
File.saveString(chpath, autopath+"channel.txt");

wait(100);
run("Quit");
