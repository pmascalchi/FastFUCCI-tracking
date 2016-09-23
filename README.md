
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
    - Example of Autoclick Robot list of actions, saved as a .csv file.
    
Guidelines:
1. Double-click on the "AutoclickRobot-with-comment" .jar file. Empty table should appear.
2. Load

Sources:
- AutoclickRobot = http://autoclick-robot.en.softonic.com
- Trackmate in Fiji = http://fiji.sc/Fiji
Schindelin, J.; Arganda-Carreras, I. & Frise, E. et al. (2012), "Fiji: an open-source platform for biological-image analysis", Nature methods 9(7): 676-682. 
