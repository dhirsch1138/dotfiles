{ config, pkgs, ... }:
{
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
    notepad-next
    qemu
    quickemu
    stow
    vorta
    w3m
  ];
}
