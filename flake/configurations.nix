{ lib, inputs, ... }:
let
  darwinHosts = [
    "hrk"
  ];
  mkDarwin =
    host:
    inputs.nix-darwin.lib.darwinSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ../modules/darwin
        { networking.hostName = lib.mkDefault host; }
        ../system/${host}.nix
      ];
    };
in
{
  flake.darwinConfigurations = lib.genAttrs darwinHosts mkDarwin;
}
