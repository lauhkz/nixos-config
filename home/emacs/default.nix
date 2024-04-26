{ pkgs, config, ... }:

{
  services.emacs.enable = true;

  programs = {
    emacs = {
     enable = true;
    };
  };
  home.file = {
      ".config/doom" = {
            source = ./doom;
            recursive = true;
          };
  };

  #home.file = {
    #".emacs.d/init.el" = {
     #source = ./init.el;
     #recursive = true;
    #};
    #".emacs.d/config.el" = {
     #source = ./config.el;
     #recursive = true;
    #};
  #};
}
