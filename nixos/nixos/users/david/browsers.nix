{ config, pkgs, ... }:
{
  
  programs.qutebrowser.enable = true;
  programs.librewolf.enable = true; 

  #programs.firefox.enable = true;

  home.packages = with pkgs; [
    lynx
  ];
}
