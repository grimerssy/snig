{ ... }:
{
  # TODO man pages
  imports = [
    ./cli
    ./darwin
    ./gui
    ./shell
    ./tui
    ./utils

    # TODO
    ./todo/docker.nix # darwin
    ./todo/env.nix # somewhere in home + tldr
    ./todo/gpg.nix # darwin
    ./todo/scripts.nix # home/darwin program modules
  ];
  home.stateVersion = "24.11";
  # TODO?
  programs.git = {
    userName = "Stanislav Stoyanov";
    userEmail = "grimerssy@gmail.com";
  };
}
