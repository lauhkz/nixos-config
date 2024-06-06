{
  inputs,
  lib,
  pkgs,
  config,
  outputs,
  ...
}: {
  imports =
    [
      ./browser/default.nix
      ./windowManager/i3/default.nix
      ./programs/tmux/default.nix
      ./programs/fzf/default.nix
    ]
    ++ (builtins.attrValues outputs.homeManagerModules);

  # Wezterm config file
  xdg.configFile = {
    "wezterm/wezterm.lua" = {
      source = ./terminal/wezterm/wezterm.lua;
      recursive = true;
    };
  };

  home.homeDirectory = "/home/l@z";
  home.username = "l@z";

  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
