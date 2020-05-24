# dotfiles
dotfiles for my linux install

Contains my personal setup for:
* i3 using i3bar
* xmonad using xmobar

This repo is meant to be cloned into a ~/.dotfiles directory (alterations to directory will require changes to paths)

Example how to clone (from your home directory):
git clone https://github.com/dhirsch1138/dotfiles .dotfiles

Once cloned:
1. Look at the ReadMes/Documents/SetupReadMe directory
2. identify the text file for the wm you wish to use (i3 or xmonad)
3. Look at the text file and install whatever packages it has listed
   (feel free to omit/change, just know that these config files call these programs.
    They'll need to be updated).
4. XMONAD ONLY - edit xmobar/.config/xmobar.hs
              find the line that starts with ", Run Com "python" ["/home/david"
              replace "david" with your username
              and other spawnOnce command may have user specific directories that
              need to be changed
5. Install the gnu stow utility
6. You will probably need to delete the README.md
7. In the directory you cloned into, type "stow *" to create symlinks for all of the
   config files and documentation.
   READ THE STOW MAN PAGE TO UNDERSTAND WHAT IT DOES AND HOW IT WORKS.

Once in new WM
1. use nitrogen to set background 
