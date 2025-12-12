How to deploy
# complete minimal nixos install
# create nix shell in ~
## stow
## git
## vim
# clone this repo into ~
# rename cloned folder to ~/.dotfiles
# cd .dotfiles
# use stow to deploy all folders
# determine host & user
## either use existing host/user files
## copy/create new files
## Add new host/users to .dotfiles/nixos/nixos/flake.nix
## git add -A in .dotfiles/ if needed
# run ~/nixos/scripts/initialSetup.sh
