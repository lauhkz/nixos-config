{ pkgs, config, ... }:

{
  home = {
    pointerCursor = {
      gtk.enable = true;
      name = "Catpuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catpuccin-Mocha-Compact-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["blue"];
        size = "compact";
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    font = {
      name = "FiraCode Nerd Mono Medium";
    };
  };
}
