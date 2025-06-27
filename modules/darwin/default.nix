{ inputs, ... }:
{
  imports = [
    inputs.mac-app-util.darwinModules.default
    ../shared
    ./home-manager.nix
    ./keyboard.nix
    ./shell.nix
    ./users.nix
  ];
}
