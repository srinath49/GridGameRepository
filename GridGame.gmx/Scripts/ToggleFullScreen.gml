if cobj_toggleFullScreen.fullScreen == false
{
  window_set_fullscreen(1);
  cobj_toggleFullScreen.fullScreen = true;
}

else
{
  window_set_fullscreen(0);
  cobj_toggleFullScreen.fullScreen = false;
}

