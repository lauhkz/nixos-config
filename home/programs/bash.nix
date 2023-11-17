{ pkgs, config, ... }:

{
  programs = {
   bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
     ns = "sudo nixos-rebuild switch --flake ~/nixos-config/.#desktop";
    };
   };
  };
}
