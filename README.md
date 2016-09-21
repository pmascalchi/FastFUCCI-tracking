
-------------------------------------------------------------------------------
### **FastFUCCI-tracking**
Set of macros to track individual FastFUCCI cells with Trackmate plugin for ImageJ/Fiji.
Scripts are in the order of use. Further details included in macros or in original publication XX.

1. ImageJ/Fiji macro for image processing. Initial data should be multichannel timelapse for individual stage positions. First channel has to be green, second one red. Other channels are not taken in account.

2. Set of scripts used for automation of Trackmate. Main script is a java code named "Autoclick Robot"
    Content:
    - "Autoclick Robot" .jar file 
    - Microsoft Windows batch files to open Fiji and subsequently run each macro listed below, in batch mode.
    - ImageJ/Fiji macros used to open each timelapse video, handle Trackmate exported data and format it to extract essential data.
    - Example of Autoclick Robot list of actions, saved as a .csv file.
    
Guidelines:
