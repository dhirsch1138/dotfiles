# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./cryptDevices.nix
      ../shared/steam.nix # games!
      ../shared/zram.nix # ram based compressed swap
      ../shared/blocky.nix # local ad block dns 
      ../shared/nixSettings.nix # global nix tweaks 
      ../shared/power.nix # power management stuffs
    ];

  # enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #boot.initrd.luks.devices."luks-ca1ecd12-cbc0-43e3-8236-330a80c0ff01".device = "/dev/disk/by-uuid/ca1ecd12-cbc0-43e3-8236-330a80c0ff01";
  networking.hostName = "crow"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Basic display manager
  services.greetd = {                                                      
    enable = true;                                                         
    settings = {                                                           
      default_session = {                                                  
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "greeter";                                                  
      };                                                                   
    };                                                                     
  };
  
  
  # enable Sway window manager
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  #trying niri
  programs.niri.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.david = {
    isNormalUser = true;
    description = "David Hirsch";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
   ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    alacritty
    # ffmpeg-full # get multimedia functions (like more hardware acceleration for web)
    (ffmpeg-full.override { withUnfree = true; })
    fuzzel # fancier dmenu
    git # version control
    grim # screenshot functionality
    libnotify # get tui notification commands
    mako # notification system developed by swaywm maintainer
    networkmanagerapplet # network systray program
    nh # nix helper
    pulseaudio # get volume control programs
    slurp # screenshot functionality
    udiskie # automagic drive handling (like usb sticks)
    vim # does vimmy things
    waybar # for sway
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
  ];

  # don't enable here, it autostarts but only once
  #waybar for sway <3
  #  programs.waybar.enable = true;

  #firefox, of course moved to home
  # programs.firefox.enable = true;

  # GUI file manager w/ plugins
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-vcs-plugin
      thunar-volman
    ];
  };
      
  #gamemode
  #  programs.gamemode.enable = true;

  # udisks to help manage removable media
  #   udiskie uses this to provide automount <3
  services.udisks2.enable = true;

  # Enable the gnome-keyring secrets vault. 
  # Will be exposed through DBus to programs willing to store secrets.
  services.gnome.gnome-keyring.enable = true;

  # enable polkit so things can ask for escalation politely
  security.polkit.enable = true;

  # hardware acceleration
  hardware.graphics.enable = true;

  # enable system wide notifications
  # services.systembus-notify.enable = true;

  #fonts.packages = with pkgs; [ nerd-fonts.noto ];
  
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      font-awesome
      source-han-sans
      source-han-serif
    ];
    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Source Han Serif" ];
      sansSerif = [ "Noto Sans" "Source Han Sans" ];
    };
  };
 

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
