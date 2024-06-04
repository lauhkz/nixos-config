{ config, pkgs, ... }:

{
  imports = [ ../../home/home.nix ];
  home.username = "l@z";
  home.homeDirectory = "/home/l@z";

  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
