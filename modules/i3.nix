{ pkgs, ... }:

{
 environment.pathsToLink = [ "/libexec" ];
 services = {
  xserver = {
   enable = true;

    layout = "us";
    xkbVariant = "dvp";
    xkbOptions = "ctrl:swapcaps, grp:alt_shift_toggle";

   desktopManager = {
    xterm.enable = false;
   };

   displayManager = {
    defaultSession = "none+i3";
    lightdm.enable = false;
    gdm.enable = true;
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
