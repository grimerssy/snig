{ ... }:
{
  home-manager = {
    sharedModules = [ ../home ];
    useGlobalPkgs = true;
  };
}
