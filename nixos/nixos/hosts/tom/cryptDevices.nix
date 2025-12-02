{ config, pkgs, ... }:
{
  boot.initrd.luks.devices."luks-70721ac2-f0e1-4eba-a1d5-c6942397331c".device = "/dev/disk/by-uuid/70721ac2-f0e1-4eba-a1d5-c6942397331c";
}
