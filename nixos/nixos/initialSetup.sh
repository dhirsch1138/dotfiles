# Get host
echo "enter host"
#hs=$(nix shell nixpkgs#gum --command sh -c "gum input --placeholder $(hostname)")
read hs
hsPath="./hosts/$hs"
echo Hello, I am $hs
echo I need to setup some device specific files before I can do nixxy stuff.
echo
echo I will:
echo - delete the existing hardware *.nix files in $hsPath
echo -- hardware-configuration.nix
echo -- cryptDevices.nix
echo - copy the current hardware-configuration.nix from /etc/nixos to $hsPath
echo - extract the crypt device from /etc/nixos/configuration.nix and use it to build $hsPath/cryptDevices.nix
rm $hsPath/hardware-configuration.nix
rm $hsPath/cryptDevices.nix
cp /etc/nixos/hardware-configuration.nix $hsPath/hardware-configuration.nix
touch $hsPath/cryptDevices.nix
echo { config, pkgs, ... }: >> $hsPath/cryptDevices.nix
echo { >> $hsPath/cryptDevices.nix
cat /etc/nixos/configuration.nix | grep boot.initrd.luks.devices >> $hsPath/cryptDevices.nix
echo } >> $hsPath/cryptDevices.nix
