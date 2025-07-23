{ ... }:
{
  flake = {
    darwinModules = {
      default.imports = import ../darwin/module-list.nix;
      configurations = import ../darwin/configuration/modules.nix;
    };
    homeManagerModules = {
      default.imports = import ../home/module-list.nix;
      configurations = import ../home/configuration/modules.nix;
    };
  };
}
