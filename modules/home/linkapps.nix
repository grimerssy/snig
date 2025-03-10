# https://github.com/nix-community/home-manager/blob/b71edac7a3167026aabea82a54d08b1794088c21/modules/targets/darwin/linkapps.nix
{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.targets.darwin;
in
{
  disabledModules = [ "targets/darwin/linkapps.nix" ];
  options.targets.darwin.linkApps = {
    enable = lib.mkEnableOption "linking macOS applications to the user environment" // {
      default = true;
    };

    directory = lib.mkOption {
      type = lib.types.str;
      default = "Applications/Home Manager Apps";
      description = "Path to link apps relative to the home directory.";
    };
  };

  config = lib.mkIf (pkgs.stdenv.hostPlatform.isDarwin && cfg.linkApps.enable) {
    # Install MacOS applications to the user environment.
    home.file.${cfg.linkApps.directory}.source =
      let
        apps = pkgs.buildEnv {
          name = "home-manager-applications";
          paths = config.home.packages;
          pathsToLink = "/Applications";
        };
      in
      "${apps}/Applications";
  };
}
