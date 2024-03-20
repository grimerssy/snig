{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-23.11-darwin";
    unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    inputs @ { nixpkgs
    , darwin
    , home-manager
    , ...
    }:
    let
      user = "grimerssy";
      host = "mbpssy";
      system = "aarch64-darwin";
      getDir = dir:
        builtins.mapAttrs
          (
            file: type:
              if type == "directory"
              then getDir "${dir}/${file}"
              else type
          )
          (builtins.readDir dir);
      getFiles = dir:
        nixpkgs.lib.collect
          builtins.isString
          (
            nixpkgs.lib.mapAttrsRecursive
              (path: type: builtins.concatStringsSep "/" path)
              (getDir dir)
          );
      nixFiles = dir:
        map
          (file: dir + "/${file}")
          (
            builtins.filter
              (file: nixpkgs.lib.hasSuffix ".nix" file)
              (getFiles dir)
          );
    in
    {
      darwinConfigurations.${host} = darwin.lib.darwinSystem {
        inherit system;
        specialArgs = { inherit user; };
        modules = builtins.concatLists [
          (nixFiles ./modules)
          (nixFiles ./system)
          [
            home-manager.darwinModules.home-manager
            {
              users.users.${user} = {
                name = user;
                home = "/Users/" + user;
              };
              home-manager = {
                useGlobalPkgs = true;
                users.${user} = { imports = nixFiles ./home; };
              };
            }
            {
              nixpkgs.overlays =
                map
                  (overlay: import overlay inputs)
                  (nixFiles ./overlays);
            }
          ]
        ];
      };
    };
}
