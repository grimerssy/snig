{ pkgs, ... }:
{
  home.packages = with pkgs; [
    comma
    colima
    docker
    ( uutils-coreutils.override { prefix = ""; })
  ];
}
