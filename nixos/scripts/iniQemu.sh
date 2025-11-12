echo Select iso to load, vm files will be built in same directory
isoFile=$(nix shell nixpkgs#gum --command sh -c "gum file $HOME")
echo you picked $isoFile
confFile=$(nix shell nixpkgs#gum --command sh -c "gum input --placeholder \"Enter name for *.conf file\"")
echo you picked $confFile
