{ ... }:
{
  flake = {
    darwinModules = {
      default.imports = import ../darwin/module-list.nix;
      configurations = import ../darwin/configurations/modules.nix;
    };
    homeModules = {
      default.imports = import ../home/module-list.nix;
      configurations = import ../home/configurations/modules.nix;
    };
  };
}
