# CarouselMenu
Carousel menu

This is a simple carousel menu example. 
I think that a carousel menu will most often have the same items shown to the user.   
And if an item is not available it can be greyed out and skipped over 
(however I did not get that far with this example). 
Instead of using math to determine each menu items location I used predefined positions. When the menu is rotated 
(using the left/right keys in my example) the menu item has its position and scale tweened to the next position. 
I don't get a true elipse doing it this way but it looks good and is very flexible. You can move the menu items 
around without having to recalculate positions.    
The front menu (active menu) is scaled 1.5. The next row back is scaled 1. Behind that is scaled .75 and the 
item at the back is scaled .5.   
Pressing enter fires a signal with the active menu bound to it (and prints out the selected menu items name).    
