# Full Game Timer Guide
This is a guide for setting up the timer for full game runs.

This timer is specifically designed for Shadow Tactics, which will automatically:
* Start the timer once Osaka Castle is loaded
* Split the timer upon loading each subsequent level
* Stop the timer on the final stats screen of Sunpu Castle
* Pause the timer during any loads

The timer does not include automated reset.

The timer is programmed to only split if you do levels in the correct order. For example, after playing level 1, the timer will only split once level 2 is loaded. If you complete level 1 then accidentally select level 3, you can back out and go to level 2 and the splits will proceed as normal.

This timer will occasionally fail to perform some splits. Apologies for this inconvenience, this game's internal values are unusually difficult to capture.


## Requirements
Windows PC only.

The autosplitter was created using version 2.2.11F of Shadow Tactics and may or may not work with other versions of the game. 


## Download LiveSplit
LiveSplit is a timer app which has access to the Shadow Tactics autosplitter.

Download LiveSplit here: https://livesplit.org/downloads/


## Configuring LiveSplit
When you launch LiveSplit.exe for the first time, you should see a black box with 0.00 appear.

1. Right-click the box and select "Edit Splits..." to open the Splits Editor

![splits editor](https://user-images.githubusercontent.com/104397629/196058305-74aace7d-ebe4-4da8-9e94-10ab4eec9395.PNG)

2. For *Game Name*, start typing "Shadow Tactics: Blades of the Shogun" and select the same from the dropdown.
3. For *Run Category*, enter the name of the category you're running (can be anything).
4. Click the *Activate* button to enable the autosplitter.
5. In the table, add a segment for each level of the game (use *Insert Below* to add more rows). You can call them anything but there must be 13 of them.

![st_splits_screenshot](https://github.com/smorrrs/Shadow-Tactics-Resources/assets/104397629/53d8cd10-d436-400e-b485-15beb2644e5e)


6. Press *OK*

The timer should now be fully configured and automatically begin when you start the first level of the game.


## Adding Timer with Loads
In addition to the timer with load removal, you can add a second timer that includes loads:

1. Right-click LiveSplit and select "Edit Layout..."
2. Click the "+" button and select Timer > Timer
3. Click Layout Settings
4. Select the tab for the new Timer (will be the last one by default)
5. Set Timing Method to Real Time
6. The previous Timer should have Timing Method set to Game Time
7. You can set which timer your splits are based off of by going to the Splits tab and setting all Timing Methods to Game Time for loadless or Real Time for time with loads

![layout settings](https://user-images.githubusercontent.com/104397629/196529329-6884209c-d2e0-48b1-8053-e839b10325bf.PNG)


## Troubleshooting
If the timer isn't working, make sure you have the latest version of Shadow Tactics. You can find the version you have in the bottom left corner of the main menu screen in the game. 

If you're still having trouble/ the autosplitter doesn't work with the latest version of the game, feel free to contact smorrs#4260 on discord. I'll try to assist if I have time.


## Feedback
If you'd like the splitting logic to work differently and you know how to implement the desired changes, please offer your suggestion to smorrs#4260 on discord. 

If you have the ability to find more consistent addresses for splits that would be very helpful. It's difficult to find a value that works for all computers & distributions since I only have access to one combo.
