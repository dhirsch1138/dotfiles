hs=$(hostname)
nix-shell -p banner lolcat --run "banner NIX Update! | lolcat"
echo updating flake.nix in $(pwd)
nix shell nixpkgs#gum --command sh -c "gum spin --spinner dot --title \"Waiting five seconds... (control+c to abort)\" -- sleep 5"
echo -----------
echo calling "nix flake update"
nix flake update
echo update complete
echo building derivation to determine changes
nixos-rebuild build --flake ./#$hs
echo derivation built, performing diff
# echo method 1: using "nix store diff-closures"
# nix store diff-closures /run/current-system ./result
echo method 2: using nvm diff
nix-shell -p nvd --run "nvd diff /run/current-system/ ./result"
rm result
