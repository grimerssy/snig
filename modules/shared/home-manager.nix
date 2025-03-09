{
  inputs,
  nixpkgs-stable,
  nixpkgs-unstable,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = { inherit inputs nixpkgs-stable nixpkgs-unstable; };
    sharedModules = [ ../home ];
    useGlobalPkgs = true;
  };
}
