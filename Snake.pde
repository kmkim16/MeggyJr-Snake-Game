#include <MeggyJrSimple.h>
/*create instance variables - cursor x and y coord, dot x and y coord
//create directional variable 0, 90, 180, 270
//draw player and dot
//if direction is up, add one to y
//if direction is down, decrease y by one
//adjust values
//if the cursor is in the same position as the dot
//Add a dot one pixel under the cursor
clear and delay slate
*/

int xcoord = 3; //player coordinates
int ycoord = 4;
int direction = 0;
int speed = 300; //speed variable
int xapple = random(8); //random apple coordinates
int yapple = random(8);
boolean ateApple = true;
int value = 0;
//int applesEaten = 0; SetAuxLight

void setup()
{
  MeggyJrSimpleSetup();
}

void loop()
{ 
  DrawPx(xapple,yapple,1);
  DrawPx(xcoord,ycoord,4);
  
  CheckButtonsPress();
  if (Button_Up) //if up button is pressed, set direction to 0
    direction = 0;
     
  if (Button_Down) //if down button is pressed, set direction to 180
    direction = 180;
     
  if (Button_Right) //if right button is pressed, set direction to 90
    direction = 90;
     
  if (Button_Left) //if left button is pressed, set direction to 270
    direction = 270;
 
  if (Button_A)
    speed = 150;
  if (Button_B)
    speed = 300;
     
  if (direction == 0) //if the direction is 0 (up), increase ycoord by 1
    ycoord = ycoord + 1; //x--; or x-=1
       
  if (direction == 90) //if the direction is 90 (right), increase xcoord by 1
    xcoord = xcoord + 1;
       
  if (direction == 180) //if the direction is 180 (down), decrease ycoord by 1
    ycoord = ycoord-1;
       
  if (direction == 270) //if direction is 270 (left), decrease xcoord by 1
    xcoord =xcoord-1;
 
  if (xcoord > 7) //adjusting limits
    xcoord = 0;
  if (xcoord < 0)
    xcoord = 7;
  if (ycoord > 7)
    ycoord = 0;
  if (ycoord < 0)
    ycoord  = 7;
      
  if (xcoord == xapple && ycoord == yapple)
    {
    ateApple = true;
    SetAuxLEDs((value*2)+1);
    value = (value*2)+1;
    }
    
  if (ateApple){
    xapple = random(8); //random apple coordinates
    yapple = random(8);
    ateApple = false;
  }
  
  
  
  DisplaySlate();
  delay(speed);
  ClearSlate();
}

/*
boolean ateApple = true;

if (ateApple){
  xapple = random(8);
  yapple = random(8);
  ateApple = false;
}
if (xplayer == xapple && yplayer == yapple)
  ateApple = true;
*/

/*
void loop()
  draw snake
  draw apple
  check buttons
  set directions
  move snake based on direction
  adjust limits
  collision detection
  move apple if neccessary (probably spelled wrong)
*/


