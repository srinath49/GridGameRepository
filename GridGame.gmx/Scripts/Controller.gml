if keyboard_check(ord("S"))
{
  show_message("Save Successful");
  SaveGame();
}

if keyboard_check(ord("V"))
{
  pbobj_pathBlock.visible = true;
}

if keyboard_check_released(ord("V"))
{
  pbobj_pathBlock.visible = false;
}

if keyboard_check(vk_escape)
{
  room_goto(rm_mainMenu);
}

if keyboard_check_pressed(vk_f11)
{
  ToggleFullScreen();
}
