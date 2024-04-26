{ pkgs, config, ...}:

{
  # wallpaper, binary file
  home.file.".config/i3/wallpaper-boshi.jfif".source = ./wallpaper-boshi.jfif;
  home.file.".config/i3/config".source = ./config;
  home.file.".config/i3status/config".source = ./i3status.conf;
  #home.file.".config/i3/i3blocks.conf".source = ./i3blocks.conf;
  #home.file.".config/i3/keybindings".source = ./keybindings;
  home.file.".config/i3/scripts" = {
    source = ./scripts;
    # copy the scripts directory recursively
    recursive = true;
    executable = true;  # make all scripts executable
  };
}
