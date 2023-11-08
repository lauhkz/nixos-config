{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./media.nix
    ./browser.nix
    ./udiskie.nix
    ./syncthing.nix
  ];
}
