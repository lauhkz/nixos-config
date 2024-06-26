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

    #doom-emacs = {
      #url = "github:doomemacs/doomemacs";
      #flake = false;
    #};

    #neovim = {
     #url = "github:lautar0pp/nvim-flake";
    #};

    #nurpkgs = {
     #url = "github:nix-community/NUR";
    #};
 };
  outputs = { self, nixpkgs, home-manager, ... } @ inputs: let
   inherit (self) outputs;
    vars = {
      user = "lz";
      location = "$HOME/nixos-config";
      terminal = "alacritty";
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

        specialArgs = {inherit inputs outputs vars;};
        modules = [

          ./hosts/desktop/default.nix

          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = inputs;
            home-manager.users.lz = import ./home/default.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          }
        ];
      };
    };
  };
}
