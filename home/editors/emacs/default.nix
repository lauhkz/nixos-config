{ pkgs, config, ... }:

{
  home = {
      packages = with pkgs; [
          emacs
          coreutils
          clang
          fd
      ];
      file = {
          ".config/doom" = {
              source = ./doom;
              recursive = true;
          };
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
