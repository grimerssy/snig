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
      pkgs = import nixpkgs { inherit system; };
    in rec {
      packages.${system}.default = darwinConfigurations.${host}.system;

      darwinConfigurations.${host} = with nixpkgs.lib;
        let
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
            (filter (file: hasSuffix ".nix" file && file != "default.nix")
              (getFiles dir));
        in darwin.lib.darwinSystem {
          inherit system pkgs;
          specialArgs = { inherit user; };
          modules = nixFiles ./darwin ++ [
            home-manager.darwinModules.home-manager
            {
              users.users.${user} = {
                name = user;
                home = "/Users/" + user;
                shell = pkgs.fish;
              };
              home-manager.users.${user} = { imports = nixFiles ./home; };
            }
          ];
        };
    };
}
