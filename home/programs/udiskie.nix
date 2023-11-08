#
#  Mounting tool
#

{ config, lib, pkgs, vars, ... }:

{
    services = {
      udiskie = {
        enable = true;
        automount = true;
        tray = "auto";
      };
    };
}
