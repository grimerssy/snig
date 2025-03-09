{
  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/release-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:lnl7/nix-darwin/nix-darwin-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";

    nixpkgs.follows = "nixpkgs-stable";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs: {
    darwinConfigurations.hrk = inputs.nix-darwin.lib.darwinSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./modules/darwin
        ./system/hrk.nix
      ];
    };
  };
}
