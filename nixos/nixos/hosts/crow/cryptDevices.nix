{ config, pkgs, ... }:
{
  boot.initrd.luks.devices."luks-5afdab6a-e7fc-4e28-a1d8-44593231acab".device = "/dev/disk/by-uuid/5afdab6a-e7fc-4e28-a1d8-44593231acab";
}
