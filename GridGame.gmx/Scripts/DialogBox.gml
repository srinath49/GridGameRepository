//made by Miles Lombardi
//argument0 = the text
//argument1 = whether or not to draw the box at the end
//argument2 = whether or not to initiate the text
//argument3 = whether or not to draw the text box
//argument4 = the font to use
//` = white text
//^ = red text
//{ = blue text
//} = green text
global.drawingtext = true //the game is drawing text
if argument2 = true //if it is the first time through
 {
  self.position = 1//set the position as 1
  self.done = false //the text isn't done
 }
global.text = argument0
global.more = argument1
global.font = spr_letters //set the font at the beggining of the script
//sets the postion of the pointer, so it knows how much text should be drawn
if keyboard_check(vk_enter) = true //if enter is pushed
 {
  self.done = true //you are done
  self.position = string_length(global.text) //end the text
  self.curstring = global.text //set the string to the text
  keyboard_clear(vk_enter) //stop generating events
 }
if self.done = false //if the text line isn't done
 {
  self.curstring = string_copy(global.text, 1, self.position) //the first line is a part of the actual first line
  if string_length(self.curstring) = string_length(global.text) //if the text is done
   {
    self.done = true //this line is done
    self.position = 1  //reset the start point
   }
 }
if self.done = false //if not all text is done
 {
  self.position += 1 //add one to the position
 }
//draws the important stuff
if argument3 = true //if you should draw the text box
 { 
  draw_sprite(spr_textbox, 0, view_xview[1] + 16, view_yview[1] + 160) //draw the text box
 }
self.pointx = 22 //a little to the right...
self.pointy = 166 //a little down...
for(i = 1; i < string_length(self.curstring) + 1; i += 1) //once for every character
 {
  self.lettertemp = string_copy(self.curstring, i, 1) //get the letter
  if self.pointx >= 290 //if it is too far over
   {
    self.pointx = 22 //go back a bit
    self.pointy += 16 //go down a line
   }
  if self.lettertemp <> " " and self.lettertemp <> "~" //if it isn't a space or a tilde
   {
    if self.lettertemp <> "`" and self.lettertemp <> "^" and self.lettertemp <> "{" and self.lettertemp <> "}" //if it's not changing the font
     {
      self.todraw = scr_getletter(self.lettertemp) //get the imagesingle of the value
      draw_sprite(global.font, self.todraw, view_xview[1] + self.pointx, view_yview[1] + self.pointy)
      self.pointx += 8//move over for the next letter
     }
    else //if it is changing the font
     {
      if self.lettertemp = "`" //set it white
       {
        global.font = spr_letters //sets it
       }
      if self.lettertemp = "^" //the caret
       {
        global.font = spr_letters//sets it
       }
      if self.lettertemp = "{" //blue
       {
        global.font = spr_letters //sets it
       }
      if self.lettertemp = "}" //green
       {
        global.font = spr_letters//sets it
       }
     }
   }
  if self.lettertemp = " " //if it is a space
   {
    self.pointx += 8 //move over for the next letter
   }
  if self.lettertemp = "~" //if it is a tilde
   {
    self.pointy += 16 //move down for the next letter
    self.pointx = 22 //reset to the start of the line
   }
 }
screen_refresh() //refreshes the screen so you can actually see it
if self.done = true and global.more = true //if we need to draw an arrow
 {
  draw_sprite(spr_textmore, 0, view_xview[1] + 155, view_yview[1] + 216) //draw the arrow
 }
if self.done = false //if the text isn't done
 {
   sound_play(snd_letter)
   sleep(30)
   scr_dialogbox(argument0, argument1, false, argument3) //do it all again
 }
else //yer done!
 {
  screen_refresh() //refresh the screen 
  keyboard_wait() //wait for the keyboard 
  sleep(30)
  keyboard_clear(vk_space)
  keyboard_clear(vk_shift)
  sound_stop(snd_letter)
  global.drawingtext = false //get on with your regular life
 }
