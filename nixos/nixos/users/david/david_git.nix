{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "David Hirsch";
    userEmail = "dhirsch1138@gmail.com";
  };
}
