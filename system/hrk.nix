{ pkgs, lib, ... }:
let
  host = "hrk";
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

    # TODO ##################
    uid = 501;
    shell = pkgs.fish;
    #########################

  };
  # TODO move to shared/home-manager
  home-manager.users.${user}.imports = [ ../home/${user}.nix ];

  # TODO ##################
  programs.fish.enable = true;
  users.knownUsers = [ user ];
  #########################
}
