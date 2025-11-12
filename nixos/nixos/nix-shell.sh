nix shell nixpkgs#$(nix shell nixpkgs#gum --command sh -c "gum input --placeholder package")
