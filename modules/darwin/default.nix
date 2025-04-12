{ inputs, ... }:
{
  imports = [
    inputs.mac-app-util.darwinModules.default
    ../shared
    ./home-manager.nix
    ./keyboard.nix
    # TODO remove in 25.05 https://github.com/nix-darwin/nix-darwin/pull/1344
    ./pam.nix
    ./shell.nix
    ./users.nix
    # TODO https://github.com/nix-darwin/nix-darwin/pull/1225
    ./yabai.nix
  ];
}
