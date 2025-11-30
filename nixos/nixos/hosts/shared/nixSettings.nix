{ config, pkgs, ... }:
{
  # limit concurrent jobs
  nix.settings.max-jobs = 6;
}

