{ config, lib, ... }:

with lib;

let
  cfg = config.users;
in

{
  options.users.defaultUserShell = mkOption {
    type = types.nullOr (types.either types.shellPackage types.path);
    default = null;
    description = ''
      This option defines the default shell assigned to "real" user accounts.
      This option sets {option}`shell` for users that don't define their own.
      The value of this option may not be a store path.
    '';
    example = literalExpression "pkgs.zsh";
  };

  config.users.users = genAttrs cfg.normalUsers (name: {
    shell = mkDefault cfg.defaultUserShell;
  });
}
