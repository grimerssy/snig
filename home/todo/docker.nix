{ pkgs, ... }:
{
  home.packages = with pkgs; [
    docker
    # TODO https://github.com/LnL7/nix-darwin/pull/1275
    colima
  ];
}
