{
  config,
  options,
  lib,
  inputs,
  nixpkgs-stable,
  nixpkgs-unstable,
  ...
}:

with lib;

let
  cfg = config.home-manager;
in

{
  options.home-manager.normalUserConfigRoot = lib.mkOption {
    type = lib.types.path;
    description = ''
      The root directory of home-manager configurations.
      This will be used in home-manager imports for users
      specified under ${options.users.normalUsers}.
    '';
  };

  config.home-manager = {
    extraSpecialArgs = { inherit inputs nixpkgs-stable nixpkgs-unstable; };
    sharedModules = [ ../home ];
    useGlobalPkgs = true;
    users = genAttrs config.users.normalUsers (name: {
      imports = [ "${cfg.normalUserConfigRoot}/${name}.nix" ];
    });
  };
}
