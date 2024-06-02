# gsclua_ex fork
This fork of gsclua is intended to extend the existing scripts and add new functionality. This README was copied from gsclua, see the end of the README for added functionality.

# gsclua
Lua scripts for shiny hunting in GSC games based off zep715's [rbylua](https://github.com/zep715/rbylua)   
Work only with vba rr 23.6.
Supporting games of multiple regions.

## TID
- Edit the script for desired TID
- Cursor over `NEW GAME`, run the script

## Stationary and Gift
- Pause timing depends

## Roaming Beasts
Thanks @Sipanale for adding this script.
- Modified wild script allowing for capture of legendary beasts on route 38. Script pauses on shiny encounter (toggle-able) and then automatically captures the beast.

- Location between Ecruteak City and Route 38 to start:  
  ![](https://user-images.githubusercontent.com/24725521/30697180-0ef1349c-9eac-11e7-98d5-5ae7feff0de8.png)

- Video demo:
  https://www.youtube.com/watch?v=jFTGqBfL7aE

## Wild
- Edit the script for desired species in dex number, -1 for all possible species
- Run the script when the player is in the grass, The bot will walk to right first

## Egg
- After you put the second parent, run the script

## Fishing
- Edit the script for desired species in dex number, -1 for all possible species
- Cursor over `USE` before using rod, run the script

## Catching
- Cursor over `USE` before throwing Poke Ball, run the script

# Viewer
Location code for legendary beasts:
![](Viewer/Location%20Code.png)

# Credit
- zep715 for original code
- Real96 for better region/version checks and addresses finding
- /u/Koroze23 for addresses finding and korean bots testing
- RichardPaulAstley for supporting and addresses finding
- Sipanale for legendary beasts hunting scripts

## New functionality

# Odd Egg
An adaptation of the gift script that automates siny hunting the Odd Egg. See the comments at the top of the script for instructions on filtering for a specific Pokemon, as well as when to start the script when receiving the egg.

# Unown
The unown script now has a toggleable parameter to hunt for shinies