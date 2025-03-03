{ ... }:
{
  imports = [
    ./copyapps.nix
    ./extraPrograms.nix
    # TODO remove in 25.05
    ./linkapps.nix
  ];
}
