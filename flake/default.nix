{ inputs, ... }:
{
  systems = inputs.nixpkgs.lib.systems.flakeExposed;
  imports = [
    # keep-sorted start case=no numeric=yes
    ./formatter.nix
    ./modules.nix
    # keep-sorted end
  ];
}
