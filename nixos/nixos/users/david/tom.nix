{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "david";
  home.homeDirectory = "/home/david";

  imports = [
      ./david_git.nix
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos, btw";
      nix-update = "pwd=$(pwd) && cd ~/nixos/scripts && ./nix-update.sh && cd $pwd";
      nix-switch = "pwd=$(pwd) && cd ~/nixos/scripts && ./nix-switch.sh && cd $pwd";
    }; 
  };

  
  programs.librewolf.enable = true;
  #programs.firefox.enable = true;

  home.packages = with pkgs; [
    adwaita-icon-theme
    banner
    bat
    gh
    github-desktop
    gnome-themes-extra
    gum
    imv
    lazygit
    lolcat
    lutris
    qemu
    quickemu
    stow
    vorta
    w3m
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
