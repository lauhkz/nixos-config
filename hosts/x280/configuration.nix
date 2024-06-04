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

 nixpkgs.overlays = [ inputs.nvim-flake.overlays.default ];

 environment.systemPackages = with pkgs; [ nvim-pkg ];
  # Use the systemd-boot EFI boot loader.
  boot.loader = {
       systemd-boot.enable = true;
       efi = {
         canTouchEfiVariables = true;
       };
       grub = {
	  efiSupport = true;
	  devices = "nodev";
       };
  };

   networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Enable the X11 windowing system.
   #services.xserver.displayManager.gdm.enable = true;
   #services.xserver.desktopManager.gnome.enable = true;
}

