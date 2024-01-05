# TODO
# lldb debugger https://github.com/NixOS/nixpkgs/pull/211321

{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, darwin, home-manager }:
    let
      user = "grimerssy";
      host = "mbpssy";
      system = "aarch64-darwin";
      utils = with nixpkgs.lib; rec {
        getDir = dir:
          mapAttrs (file: type:
            if type == "directory" then getDir "${dir}/${file}" else type)
          (builtins.readDir dir);
        getFiles = dir:
          collect isString
          (mapAttrsRecursive (path: type: concatStringsSep "/" path)
            (getDir dir));
        nixFiles = dir:
          map (file: dir + "/${file}")
          (filter (file: hasSuffix ".nix" file) (getFiles dir));
      };
    in {
      darwinConfigurations.${host} = darwin.lib.darwinSystem {
        inherit system;
        specialArgs = { inherit user; };
        modules = utils.nixFiles ./modules ++ utils.nixFiles ./darwin ++ [
          home-manager.darwinModules.home-manager
          {
            users.users.${user} = {
              name = user;
              home = "/Users/" + user;
            };
            home-manager = {
              useGlobalPkgs = true;
              users.${user} = { imports = utils.nixFiles ./home; };
            };
          }
          { nixpkgs.overlays = map import (utils.nixFiles ./overlays); }
        ];
      };
    };
}
