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
  outputs =
    inputs@{
      nixpkgs,
      nix-darwin,
      home-manager,
      ...
    }:
    let
      user = "grimerssy";
      host = "mbpssy";
    in
    {
      darwinConfigurations.${host} = nix-darwin.lib.darwinSystem {
        inherit inputs;
        # TODO clean up this mess
        modules = [
          {
            nixpkgs.hostPlatform = nixpkgs.lib.systems.examples.aarch64-darwin;
          }
          home-manager.darwinModules.home-manager
          ./modules/darwin
          ./system/mbpssy.nix
          {
            networking = {
              hostName = host;
              computerName = host;
            };
            users.users.${user} = {
              name = user;
              home = "/Users/" + user;
            };
            home-manager = {
              sharedModules = [ ./modules/home ];
              useGlobalPkgs = true;
              users.${user}.imports = [ ./home/${user}.nix ];
            };
          }
        ];
      };
    };
}
