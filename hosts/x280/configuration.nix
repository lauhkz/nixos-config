#s Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{inputs, config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/windowManager/i3.nix
    ];


 environment.systemPackages = with pkgs; [ nvim-pkg ];
  # Use the systemd-boot EFI boot loader.

  # Enable the X11 windowing system.
   #services.xserver.displayManager.gdm.enable = true;
   #services.xserver.desktopManager.gnome.enable = true;
}

