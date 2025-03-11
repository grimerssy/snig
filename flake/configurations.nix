{ inputs, ... }:
{
  flake.darwinConfigurations.hrk = inputs.nix-darwin.lib.darwinSystem {
    specialArgs = { inherit inputs; };
    modules = [
      ../modules/darwin
      ../system/hrk.nix
    ];
  };
}
