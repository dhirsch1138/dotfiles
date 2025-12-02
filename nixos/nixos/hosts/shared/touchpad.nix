{ config, pkgs, ... }:
{
  #Disable touchpad while typing
  services.libinput.touchpad.disableWhileTyping = true;
}

