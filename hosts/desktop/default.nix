# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, neovim-nightly, lib, ... }:

{
  imports =
    [ 
      ../../modules/system.nix
      ../../modules/i3.nix
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot = {
    loader = {
<<<<<<< HEAD
     efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
      };
      grub = {
        enable = true;
        devices = ["nodev"];
        efiSupport = true;
        useOSProber = true;
        configurationLimit = 2;
=======
      grub = {
        enable = true; 
        version = 2; 
        device = "/dev/sda"; 
>>>>>>> 035d989 (setting alacritty for thinkpad and firefox)
      };
      timeout = 1;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking.hostName = "desktop"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  system.stateVersion = "23.05"; # Did you read the comment?
}
