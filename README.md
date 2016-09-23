
-------------------------------------------------------------------------------
### **FastFUCCI-tracking**
Set of macros to track individual FastFUCCI cells with Trackmate plugin for ImageJ/Fiji.
Scripts are in the order of use. Further details included in macros and in original publication XX.

1. ImageJ/Fiji macro for **image processing**. Initial data should be multichannel timelapse for individual stage positions. First channel has to be green, second one red. Other channels are not taken in account.

2. Set of scripts used for **automation of Trackmate**. Main script is a java code named **"Autoclick Robot"**.
Content:
    - "AutoclickRobot" .jar file (modified from original source to include one column for comments)
    - Microsoft Windows batch files to open Fiji and subsequently run each macro listed below, in batch mode.
    - ImageJ/Fiji macros used to open each timelapse video, handle Trackmate exported data and format it to extract essential data.
    - Example of Autoclick Robot list of actions, saved as a .csv file. Note that a loop is managed by detecting a dummy image so you'll have to select any visible region in your screen wallpaper. Be careful not to modify the file with Microsoft Excel as it is modifying some values in the table. However, any csv editor is useful to check the steps.
    
Guidelines for Trackmate:
Evaluation of tracking is priorily performed on one video. To be able to automate the process, you need to remember which parameter is modified from its default value. 

1. Once processed, open a single-channel timelapse video in Fiji and run the plugin Trackmate (menu Plugins/Tracking/).
2. Check and correct dimensions if required and press next.
3. Click next once more (LoG detector).
4. Enter a diameter size for your nuclei and try different thresholds using "preview" button (sub-pixel accuracy is not interesting here). Do not hesitate to preview results for different timepoints moving time slider.
5. Follow next steps (with Hyperstack displayer) and add filters if required.
6. Tracking is performed by default with simple LAP tracker. Parameters depend on mobility of your cell line.
7. Play with time slider of the image and display options to check your tracking results. No need to save any data, just remember parameters that you have changed from default values. Note: do not close anything, yet!
8. Now, double-click on the "AutoclickRobot-with-comment" .jar file. Empty table should appear.
9. Open example .csv file. Column 1 = action type / column 2 to 4 = parameters (when an image is required, click on cell to get a screenshot and draw your region of interest - validation button is below) / column 5 = comments.
10. Then modify it by clicking in column 2 at the following lines:
    - 

Sources:
- AutoclickRobot = http://autoclick-robot.en.softonic.com
- Trackmate in Fiji = http://fiji.sc/Fiji
Schindelin, J.; Arganda-Carreras, I. & Frise, E. et al. (2012), "Fiji: an open-source platform for biological-image analysis", Nature methods 9(7): 676-682. 
