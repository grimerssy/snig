{ ... }:
{
  flake = {
    darwinModules = {
      default.imports = import ../modules/darwin/module-list.nix;
      configurations = import ../modules/darwin/configurations/modules.nix;
    };
    homeModules = {
      default.imports = import ../modules/home/module-list.nix;
      configurations = import ../modules/home/configurations/modules.nix;
    };
  };
}
