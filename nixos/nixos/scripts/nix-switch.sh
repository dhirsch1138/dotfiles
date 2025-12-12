hs=$(hostname)
nix shell nixpkgs#banner nixpkgs#lolcat --command sh -c "banner NIX Switch! | lolcat"
nix shell nixpkgs#gum --command sh -c "gum spin --spinner dot --title \"Waiting five seconds... (control+c to abort)\" -- sleep 5"
cd ..
echo ---------
echo Performing full system switch for $hs using its flake
echo ---------
sudo nixos-rebuild switch --flake ./#$hs
