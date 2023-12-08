{ pkgs, ... }:

{
 environment.pathsToLink = [ "/libexec" ];
 services = {
  xserver = {
   enable = true;
   desktopManager = {
    xterm.enable = false;
   };

   displayManager = {
    defaultSession = "none+i3";
    sddm = {
      enable = true;
      #theme = "${import ./sddm-theme.nix {inherit pkgs; }}";
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
