// -------------------------------------------------------------------
// Written by: Patrice Mascalchi
// Date: 2014-2016
// Location: Cancer Research Institute, University of Cambridge, UK
// -------------------------------------------------------------------

// Parameters to be modified by user // use double backslash or appropriate characters as separator (depending on OS)
autopath = "C:\\Users\\Public\\Documents\\Siang\\Automation-Fucci\\";
// --------------------------------------------------------------------------------------------------------------

mainpath = File.openAsString(autopath + "channel.txt");
mp = split(mainpath, "\n");
mainpath = mp[0];

// TRACKS ************************************************************************************************
loopnb = parseInt(File.openAsString(autopath+"loop-nb.txt"));
outn = "track-stats-tmp_" + IJ.pad(loopnb, 3);
selectWindow("Track statistics");
saveAs("results", mainpath + outn + ".csv");
wait(500);
if (isOpen(outn + ".csv")) {
     selectWindow(outn + ".csv");
     run("Close");
}

// add some data ---------------------------------------------
data = File.openAsString(mainpath + outn + ".csv");
outf = File.open(mainpath + "track-stats_" + IJ.pad(loopnb, 3) + ".csv");
dataL = split(data, "\n");
	dataC = split(dataL[0], ",");
	filtered = dataC[1] + "," + dataC[2] + "," + dataC[7] + "," + dataC[8] + "," + dataC[9] + "," + dataC[20];
print(outf, filtered + ",BEG,END");
cumul = 1;
for (r = 1; r < dataL.length; r++) {
	dataC = split(dataL[r], ",");
	filtered = dataC[1] + "," + dataC[2] + "," + dataC[7] + "," + dataC[8] + "," + dataC[9] + "," + dataC[20];
	beg = cumul + 1;
	end = cumul + parseInt(dataC[2]);
	print(outf, filtered + "," + beg + "," + end);
	cumul = cumul + parseInt(dataC[2]);
}
File.close(outf);

File.delete(mainpath + outn + ".csv");

// close links window ***********************************************************************************
if (isOpen("Links in tracks statistics")) {
     selectWindow("Links in tracks statistics");
     run("Close");
}

// SPOTS ************************************************************************************************
outn = "spots-stats-tmp_" + IJ.pad(loopnb, 3);
selectWindow("Spots in tracks statistics");
saveAs("results", mainpath + outn + ".csv");
wait(500);
if (isOpen(outn + ".csv")) {
     selectWindow(outn + ".csv");
     run("Close");
}

// sort data ----------------------------------------------
data = File.openAsString(mainpath + outn + ".csv");
outf = File.open(mainpath + "spots-stats_" + IJ.pad(loopnb, 3) + ".csv");
dataL = split(data, "\n");
for (r = 1; r < dataL.length; r++) {
	dataC = split(dataL[r], ",");
	nb = "" + (parseInt(dataC[3]) * 1500 + parseInt(dataC[8]));	// trackID * 1500 + Position_T
	while (lengthOf(nb) < 8) nb = "0" + nb;
	ind = indexOf(dataL[r], ",");		// first comma index
	dataL[r] = "" + nb + "," + substring(dataL[r], ind+1);
}
newdata = Array.sort(dataL);

for (r = 0; r < dataL.length; r++) print(outf, newdata[r]);
File.close(outf);

File.delete(mainpath + outn + ".csv");
wait(500);
if (isOpen("Log")) {
     selectWindow("Log");
     run("Close");
}

run("Brightness/Contrast...");
wait(2000);
if (isOpen("B&C")) {
     selectWindow("B&C");
     run("Close");
}




