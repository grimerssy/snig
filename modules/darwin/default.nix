{ inputs, ... }:
{
  imports = [
    inputs.mac-app-util.darwinModules.default
    ../shared
    ./home-manager.nix
    ./keyboard.nix
    # TODO remove in 25.05 https://github.com/LnL7/nix-darwin/pull/1344
    ./pam.nix
    ./shell.nix
    ./users.nix
  ];
}
