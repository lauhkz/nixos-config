{
  description = "NixOS Flake";

  inputs = {

    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
   
    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      flake = false;
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, emacs-overlay, ... }:
  let 
    vars = {
      user = "lauhkz";
      location = "$HOME/nixos-config";
      terminal = "kitty";
      editor = "nvim";
    };
  in
   {
    nixosConfigurations = {
      # Run the following command in the flake's directory to
      # deploy this configuration on any NixOS system:
      #   sudo nixos-rebuild switch --flake .#desktop
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/desktop/default.nix
         
          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = inputs;
            home-manager.users.lauhkz = import ./home/default.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          }
        ];
      };
    };
  };
}
