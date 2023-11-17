{ pkgs, config, ... }:

{
  programs = {
    kitty = {
      enable = true;
      settings = {
        background_opacity = "0.5";
        dynamic_background_opacity = "yes";
        enable_audio_bell = false;
        hide_window_decorations = "titlebar-only";
        window_padding_width = 5;
      };
    };
  };
}
