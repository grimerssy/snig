{ inputs, ... }:
{
  imports = [
    inputs.home-manager.darwinModules.home-manager
    ../shared/home-manager.nix
    # TODO https://github.com/LnL7/nix-darwin/pull/1344
    ./pam.nix
  ];
}
