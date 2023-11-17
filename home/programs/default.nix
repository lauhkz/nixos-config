{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./bash.nix
    ./browser.nix
    ./git.nix
    ./kitty.nix
    ./media.nix
    ./syncthing.nix
    ./tmux.nix
    ./udiskie.nix
  ];
}
