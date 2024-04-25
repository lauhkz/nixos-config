{ pkgs , ... }:

{
  imports = [
   ./i3
   ./programs
   ./rofi
   ./emacs
  ];

 programs = {
  # Let home Manager install and manage itself.
    home-manager.enable = true;
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
 };
  # TODO please change the username & home direcotry to your own
  home = {
   username = "lauhkz";
   homeDirectory = "/home/lauhkz";
   packages = with pkgs; [
    alacritty
    neofetch

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    fd
    fzf # A command-line fuzzy finder
    feh
    xorg.xrandr

    # misc
    feh
    tree
    which
    gawk
    gnupg

    # productivity
    btop  # replacement of htop/nmon
    gnome.file-roller
    lazygit
    ranger
    keepassxc

    # system tools
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  stateVersion = "23.05";
  };

}
