{ lib, ... }:
let
  host = "mbpssy";
  user = "grimerssy";
in
{
  system.stateVersion = 4;
  nixpkgs.hostPlatform = lib.systems.examples.aarch64-darwin;
  imports = [
    ./shared
    ./darwin
  ];
  # TODO move to lib wrapper
  networking.hostName = host;
  # TODO module for users (shared + darwin for home)
  users.users.${user} = {
    name = user;
    home = "/Users/" + user;
  };
  # TODO move to shared/home-manager
  home-manager.users.${user}.imports = [ ../home/${user}.nix ];
}
