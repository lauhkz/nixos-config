{ pkgs, config, ... }:

 {
     programs.rofi = {
        enable = true;
        terminal = "${pkgs.alacritty}/bin/alacritty";
        theme = ./configs/rofidmenu.rasi;
     };
     home.file.".config/rofi" = {
         source = ./configs;
# copy the scripts directory recursively
         recursive = true;
     };

}
