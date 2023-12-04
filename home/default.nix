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

  # TODO please change the username & home direcotry to your own
  home = {
   username = "lauhkz";
   homeDirectory = "/home/lauhkz";
   packages = with pkgs; [
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
    feh

    # misc
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
