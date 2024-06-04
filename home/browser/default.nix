{ inputs, lib, pkgs, config, ... }:
with lib;
{

    programs.firefox =  {
        enable = true;
        #extentions = with pkgs.nur.repos.rycee.firefox-addons; [
                #ublock-origin
                #darkreader
                #df-youtube
        #];
    };
}
