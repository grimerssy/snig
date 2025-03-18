{ inputs, ... }:
{
  systems = inputs.nixpkgs.lib.systems.flakeExposed;
  imports = [
    ./configurations.nix
    ./formatter.nix
  ];
}
