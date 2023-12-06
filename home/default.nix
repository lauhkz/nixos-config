{ config, pkgs, ... }:

{
  imports = [
   ./i3
   ./programs
   ./rofi
   ./nvim
   ./emacs
   ./theme
  ];
<<<<<<< HEAD

=======
  programs = {
   bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
     ns = "sudo nixos-rebuild switch --flake ~/nixos-config/.#desktop";
    };
   };
   git = {
    enable = true;
    userName = "lautar0pp";
    userEmail = "lautaro_RL@outlook.com";
   };
#   kitty = {
#     enable = true;
#     settings = {
#      background_opacity = "0.8";
#      #dynamic_background_opacity = "yes";
#      enable_audio_bell = false;
#      hide_window_decorations = "titlebar-only";
#      window_padding_width = 5;
#     };
#    };
  };
>>>>>>> 035d989 (setting alacritty for thinkpad and firefox)
  # TODO please change the username & home direcotry to your own
  home = {
   username = "lauhkz";
   homeDirectory = "/home/lauhkz";
   packages = with pkgs; [
    alacritty
    neofetch
    discord
    obs-studio

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    fzf # A command-line fuzzy finder
<<<<<<< HEAD
    feh
=======
    xorg.xrandr
>>>>>>> 035d989 (setting alacritty for thinkpad and firefox)

    # misc
    feh
    tree
    which
    gawk
    gnupg

    # productivity
    btop  # replacement of htop/nmon
    slack
    gnome.file-roller
    lazygit
    ranger

    # system tools
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  stateVersion = "23.05";
  };

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
