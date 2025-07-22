{ ... }:
{
  flake.darwinModules = {
    default.imports = import ../darwin/module-list.nix;
    configurations = import ../darwin/configuration/modules.nix;
  };
}
