{ config, pkgs, ... }:
{
  boot.initrd.luks.devices."luks-cb2145ab-86ad-442c-a25a-c9b4cd20e52c".device = "/dev/disk/by-uuid/cb2145ab-86ad-442c-a25a-c9b4cd20e52c";
}
