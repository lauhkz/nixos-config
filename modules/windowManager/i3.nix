{ pkgs, ... }:

{
 environment.pathsToLink = [ "/libexec" ];
 services = {
   displayManager = {
    defaultSession = "none+i3";
    sddm = {
      enable = true;
      #theme = "${import ./sddm-theme.nix {inherit pkgs; }}";
    };
   };
  xserver = {
   enable = true;
   desktopManager = {
    xterm.enable = false;
   };
   windowManager = {
    i3 = {
     enable = true;
     extraPackages = with pkgs; [
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
    rofi
     ];
    };
   };
  };
 };
}
