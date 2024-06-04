
  {
  description = "A simple NixOS flake";


  inputs = {
    # Nix ecosystem
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";

    home-manager = {
	url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";
    };

    #firefox-addons = {
	#url = "github:nix-community/NUR";
	#inputs.nixpkgs.follows = "nixpkgs";
    #};

    nvim-flake = {
    url = "github:lautar0pp/nvim-flake";
    };
	# TODO make my private secrets, it's a private repository, you need to replace it with your own.
	# use ssh protocol to authenticate via ssh-agent/ssh-key, and shallow clone to save time
	# TODO add doom emacs maybe?
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nvim-flake, ... }:
    let
   system = "x86_64-linux";	#current system
	pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
	lib = nixpkgs.lib // home-manager.lib;
	user = "l@z";

	mkSystem = pkgs: system: hostname:
	pkgs.lib.nixosSystem {
		system = system;
		modules = [
		  { networking.hostName = hostname; }

		  # Base configuration
		  ./modules/system/configuration.nix

		  # x280 configuration
		  (./. + "/hosts/${hostname}/configuration.nix")

		  # Hardware configuration
		  (./. + "/hosts/${hostname}/hardware-configuration.nix")
		  home-manager.nixosModules.home-manager
		  {
		     home-manager = {
	  		useGlobalPkgs = true;
	  		useUserPackages = true;
			extraSpecialArgs = { inherit inputs; };

	  		users.${user} = (./. + "/hosts/${hostname}/home.nix");
		     };
		  }
		];
		specialArgs = { inherit inputs; };
	};
  in
  {
      inherit lib;
    nixosConfigurations = {
    	x280 = mkSystem inputs.nixpkgs "x86_64-linux" "x280";
    };
  };
}
