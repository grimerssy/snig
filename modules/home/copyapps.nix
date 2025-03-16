{
  config,
  options,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.targets.darwin;
  opt = options.targets.darwin;
in

{
  options.targets.darwin.copyApps = {
    enable = mkEnableOption "copying macOS applications to the user environment";

    directory = mkOption {
      type = types.str;
      default = "Applications/Home Manager Apps";
      description = "Path relative to the home directory to copy apps to.";
    };
  };

  config = mkIf pkgs.stdenv.hostPlatform.isDarwin (
    let
      appDirectory = "${config.home.homeDirectory}/${cfg.copyApps.directory}";
    in
    mkMerge [
      (mkIf cfg.copyApps.enable {
        assertions = [
          {
            assertion = cfg.linkApps.enable -> cfg.copyApps.directory != cfg.linkApps.directory;
            message = ''
              Can't link and copy apps to the same path

              You can fix this error by setting either

                ${opt.copyApps.enable} = false;
                or
                ${opt.linkApps.enable} = false;

              Alternatively you can set

                ${opt.copyApps.directory}
                and
                ${opt.linkApps.directory}

              to different values to avoid conflicts.
            '';
          }
        ];

        home.activation.copyApplications =
          let
            apps = pkgs.buildEnv {
              name = "home-manager-applications";
              paths = config.home.packages;
              pathsToLink = "/Applications";
            };
          in
          hm.dag.entryAfter [ "writeBoundary" ] ''
            if [ -d "${appDirectory}" ]; then
              rm -rf "${appDirectory}"
            fi
            mkdir -p "${appDirectory}"
            for appFile in ${apps}/Applications/*; do
              target="${appDirectory}/$(basename "$appFile")"
              run cp ''${VERBOSE_ARG:+-v} -fHRL "$appFile" "${appDirectory}"
              run chmod ''${VERBOSE_ARG:+-v} -R +w "$target"
            done
          '';
      })

      (mkIf
        (!cfg.copyApps.enable && !(cfg.linkApps.enable && cfg.linkApps.directory == cfg.copyApps.directory))
        {
          home.activation.warnOutdatedCopyAppsDir =
            let
              warning = ''
                Warning: The directory '${appDirectory}' still exists, but copyApps is disabled.
                If you intend to use it, enable '${opt.copyApps.enable}'.
                If not, consider removing the directory to avoid confusion.'';
            in
            hm.dag.entryAfter [ "writeBoundary" ] ''
              if [ -d "${appDirectory}" ]; then
                warnEcho '${warning}'
              fi
            '';
        }
      )
    ]
  );

}
