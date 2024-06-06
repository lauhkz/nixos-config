{ pkgs , vars, ... }:
let
    vars = {
      user = "lz";
      location = "$HOME/nixos-config";
      terminal = "alacritty";
      editor = "nvim";
    };
  in
{
  imports = [
   ./i3
   ./programs
   ./rofi
   #./editors/nvim/default.nix
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
 };
  # TODO please change the username & home direcotry to your own
  home = {
   username = "lz";
   homeDirectory = "/home/lz";
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

    nicotine-plus
    anki-bin
  ];

  stateVersion = "23.05";
  };

}
