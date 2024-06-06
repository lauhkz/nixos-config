{ config, pkgs, ... }:

{
    imports = [
     ./browser/default.nix
     ./windowManager/i3/default.nix
     ./programs/tmux/default.nix
     ./programs/fzf/default.nix
    ];

  # Wezterm config file
  xdg.configFile = {
      "wezterm/wezterm.lua" = {
  	source = ./terminal/wezterm/wezterm.lua;
	recursive = true;
	};
  };

  home.username = "lz";
  home.homeDirectory = "/home/lz";

  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
