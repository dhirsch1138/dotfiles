{ config, pkgs, ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos, btw";
      nix-update = "pwd=$(pwd) && cd ~/nixos/scripts && ./nix-update.sh && cd $pwd";
      nix-switch = "pwd=$(pwd) && cd ~/nixos/scripts && ./nix-switch.sh && cd $pwd";
    }; 
  };
}
