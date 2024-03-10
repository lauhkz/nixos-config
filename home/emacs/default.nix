{ pkgs, config, ... }:

{
  programs = {
    emacs = {
     enable = true;
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
