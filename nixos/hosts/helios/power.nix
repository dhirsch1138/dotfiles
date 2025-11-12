{ config, pkgs, ... }:
{
  # don't 'deep' sleep, perhaps my motherboard is wonk and doesn't fully support 'deep'
  # https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate
  systemd.sleep.extraConfig="MemorySleepMode=deep";
}
