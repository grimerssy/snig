{
  config,
  lib,
  inputs,
  ...
}:

with lib;

let
  cfg = config.users;
  mapUsers = f: mapAttrs f cfg.users;
  # https://github.com/LnL7/nix-darwin/blob/2fb6b09b678a1ab258cf88e3ea4a966edceec6a8/modules/system/shells.nix#L27
  shellPath = v: if types.shellPackage.check v then "/run/current-system/sw${v.shellPath}" else v;
in

{
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];
  config.home-manager = {
    sharedModules = [
      inputs.mac-app-util.homeManagerModules.default
    ];
    users = mapUsers (
      _: user:
      let
        shell = shellPath user.shell;
      in
      mkIf (user.shell != null) {
        programs.tmux.shell = shell;
        programs.alacritty.settings.terminal.shell.program = shell;
      }
    );
  };
}
