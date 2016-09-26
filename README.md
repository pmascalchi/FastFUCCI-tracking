
-------------------------------------------------------------------------------
### **FastFUCCI-tracking (draft version)**
Set of macros to track individual FastFUCCI cells with Trackmate plugin for ImageJ/Fiji.
Scripts are in the order of use. Further details included in macros and in original publication XX.

1. ImageJ/Fiji macro for **image processing**. Initial data should be multichannel timelapse for individual stage positions. First channel has to be green, second one red. Other channels are not taken in account.

2. Set of scripts used for **automation of Trackmate**. Main script is a java code named **"Autoclick Robot"**.
Content:
    - "AutoclickRobot" .jar file (modified from original source to include one column for comments)
    - Image folder used by AutoclickRobot script. Mandatory: should be a direct subfolder of the .jar location.
    - Microsoft Windows batch files to open Fiji and subsequently run each macro listed below, in batch mode.
    - ImageJ/Fiji macros used to open each timelapse video, handle Trackmate exported data and format it to extract essential data.
    - Example of Autoclick Robot list of actions, saved as a .csv file. Note that a loop is managed by detecting a dummy image so you'll have to select any visible region in your screen wallpaper. Second note: any csv/table editor is useful to check the steps and/or modify them.

--
**Guidelines for Trackmate**:

Automation is done for one channel at a time (so twice for green and red), due to different intensity thresholds. 
Evaluation of tracking is priorily performed on one video. To be able to automate the process, you need to remember which parameter is modified from its default value. Besides, some modifications have to be done once to the list of automation actions to fit your configuration.


**Pre-requisite**:

Check that all provided files for the automation are saved on your local drive.
Few quick modifications of paths are required in all Fiji macros: "Fucci-tracking-INIT_1.0.ijm", "Fucci-tracking_1.0.ijm", "Fucci-tracking-SAVE_2.0.ijm", "Fucci-tracking-END_1.0.ijm".
...and in .bat files: "Automation-INIT.bat", "Automation-Fucci.bat", "Automation-SAVE.bat", "Automation-END.bat".

1. Once processed, open a single-channel timelapse video in Fiji and run the plugin Trackmate (menu Plugins/Tracking/).
2. Check and correct dimensions if required and press next.
3. Click next once more (LoG detector).
4. Enter a diameter size for your nuclei and try different thresholds using "preview" button (sub-pixel accuracy is not interesting here). Do not hesitate to preview results for different timepoints moving time slider.
5. Follow next steps (with Hyperstack displayer) and add filters if required.
6. Tracking is performed by default with simple LAP tracker. Parameters depend on mobility of your cell line.
7. Play with time slider of the image and display options to check your tracking results. No need to save any data, just remember parameters that you have changed from default values. Note: do not close anything, yet!
8. Now, double-click on the "AutoclickRobot-with-comment" .jar file. Empty table should appear.
9. Open example .csv file. Column 1 = action type / column 2 to 4 = parameters (when an image is required, click on cell to get a screenshot and draw your region of interest - validation button is below) / column 5 = comments.
10. Then modify Autoclick table by clicking in column 2 at the following lines:
    - line 1 to select file "Automation-INIT.bat"
    - line 4 to select file "Automation-Fucci.bat"
    - line 45 to select file "Automation-SAVE.bat"
    - line 54 to select file "Automation-END.bat"
11. Modify captured images (still by clicking in column 2) at the following lines:
    - line 3 to capture a dummy region (wallpaper)
    - line 55 to capture a region that is hidden by the video when Fiji is running
12. Then look at comments to adjust steps with your tracking parameters, notably lines 9, 12, 27 (mean intensity filter threshold selection), 30, 33 and 39 (track length filter threshold selection).
13. Save the list of actions as .csv.
14. Close Fiji.
15. In AutoclickRobot window, start automation with Execute>Run commands (or CTRL+R). IMPORTANT: any move of the mouse will STOP the automation, and you can use this strategy to do some tests with automated actions...

**Output**:
- Tracks statistics "track-stats-...csv"
- Individual spots in tracks "spots-stats-...csv"
- Video duplicate with tracking result overlay "TrackMate_xy...avi"

--
Sources:
- AutoclickRobot = http://autoclick-robot.en.softonic.com
- Trackmate in Fiji = http://fiji.sc/Fiji, Schindelin, J.; Arganda-Carreras, I. & Frise, E. et al. (2012), "Fiji: an open-source platform for biological-image analysis", Nature methods 9(7): 676-682. 
