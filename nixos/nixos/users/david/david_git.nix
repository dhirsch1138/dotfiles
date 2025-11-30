{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings.user.name = "David Hirsch";
    settings.user.email = "dhirsch1138@gmail.com";
  };
}
