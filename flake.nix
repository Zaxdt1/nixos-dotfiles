{

  inputs = {
    # System package repository
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    # Home Manager repository tracking the same nixpkgs version
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, chaotic, ... }@inputs: {
    nixosConfigurations.pcmain = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = { inherit inputs; };

      modules = [
        ./configuration.nix
        chaotic.nixosModules.nyx-cache      # binary cache — don't skip this
        chaotic.nixosModules.nyx-overlay
        chaotic.nixosModules.nyx-registry

        # Pull Home Manager straight out of our flake inputs
        home-manager.nixosModules.home-manager
        {


          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs; }; # <-- Fixes module data passing



          home-manager.users.zaxdt = {
  imports = [
    inputs.spicetify-nix.homeManagerModules.default  # <-- Handle the module setup strictly here
    ./home.nix
  ];
};



        }
      ];
    };
  };
}
