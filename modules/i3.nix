{ pkgs, ... }:

{
 environment.pathsToLink = [ "/libexec" ];
 services = {
  xserver = {
   enable = true;

<<<<<<< HEAD
=======
    layout = "us";
    xkbVariant = "dvp";
    xkbOptions = "ctrl:swapcaps";

>>>>>>> 035d989 (setting alacritty for thinkpad and firefox)
   desktopManager = {
    xterm.enable = false;
   };

   displayManager = {
    defaultSession = "none+i3";
    sddm = {
      enable = true;
      theme = "${import ./sddm-theme.nix {inherit pkgs; }}";
    };
   };

   windowManager = {
    i3 = {
     enable = true;
     extraPackages = with pkgs; [
	rofi
	dunst
	i3blocks
	i3lock-color
	xautolock
	i3status
	i3-gaps
	picom
    acpi
	arandr
	xbindkeys
	sysstat
     ];
    };
   };
  };
 };
}
