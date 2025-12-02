{ config, pkgs, ... }:
{
  #Disable touchpad while typing
  services.libinput.touchpad.disableWhileTyping = true;
  #Disable tap to click
  services.libinput.touchpad.tapping = false;
}

