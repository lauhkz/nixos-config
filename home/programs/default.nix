{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./bash.nix
    ./browser.nix
    ./dunst.nix
    ./flameshot.nix
    ./fzf.nix
    ./git.nix
    ./kitty.nix
    ./media.nix
    ./syncthing.nix
    ./tmux.nix
    ./udiskie.nix
    ./zsh.nix
  ];
}
