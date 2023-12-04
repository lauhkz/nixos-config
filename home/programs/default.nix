{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./bash.nix
    ./browser.nix
    ./flameshot.nix
    ./git.nix
    ./kitty.nix
    ./media.nix
    ./syncthing.nix
    ./tmux.nix
    ./udiskie.nix
  ];
}
