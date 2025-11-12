echo Select conf file to load
file=$(nix shell nixpkgs#gum --command sh -c "gum file $HOME")
echo you picked $file
quickemu --vm $file
