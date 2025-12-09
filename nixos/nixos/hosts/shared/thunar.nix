{ config, pkgs, ... }:
{
  # GUI file manager w/ plugins
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-vcs-plugin
      thunar-volman
    ];
  };
}

