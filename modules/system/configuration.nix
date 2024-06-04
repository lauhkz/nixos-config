#s Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
   networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
   time.timeZone = "America/Argentina/Buenos_Aires";
   time.hardwareClockInLocalTime = true;

   console.useXkbConfig = true;

# Enable sound with pipewire.
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    hardware.opengl.enable = true;

    services = {
        libinput.enable = true;
        xserver = {
            enable = true;
            xkb = {
                layout = "us";
                options  = "ctrl:ctrl_modifier";
            };
        };
        openssh = {
            enable = true;
        };
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
        };
    };

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users."l@z" = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager" "adbusers"]; # Enable ‘sudo’ for the user.
   };

  # List packages installed in system profile.
   environment = { 
       variables = {
	 EDITOR = "nvim";
	 VISUAL = "emacsclient";
       };
       systemPackages = with pkgs; [
     git
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     firefox
     keepassxc
     wezterm
      ];
   };

  fonts = {
     packages = with pkgs; [
	 jetbrains-mono
	 roboto
	 (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
     ];
  };

  # Android development tools
  programs.adb.enable = true;

  programs.dconf.enable = true;

  nixpkgs.config.allowUnfree = true;
   
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

    nix = {                                   # Nix Package Manager settings
        settings ={
            auto-optimise-store = true;           # Optimise syslinks
	    allowed-users = [ "l@z" ];
        };

        gc = {                                  # Automatic garbage collection
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 2d";
        };

        package = pkgs.nixFlakes;    # Enable nixFlakes on system
            extraOptions = ''
            experimental-features = nix-command flakes
            keep-outputs          = true
            keep-derivations      = true
            '';
    };

  system.stateVersion = "24.05"; # Did you read the comment?

}
