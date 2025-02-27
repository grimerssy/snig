{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-24.11-darwin";
    unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:lnl7/nix-darwin";

    home-manager.url = "github:nix-community/home-manager/release-24.11";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    _inputs@{
      nixpkgs,
      darwin,
      home-manager,
      ...
    }:
    let
      user = "grimerssy";
      host = "mbpssy";
      system = "aarch64-darwin";
    in
    {
      darwinConfigurations.${host} = darwin.lib.darwinSystem {
        inherit system;
        modules = [
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
