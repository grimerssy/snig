{ pkgs, ... }:
{
  imports = [ ../modules/linkapps.nix ];
  home.packages = with pkgs; [
    telegram-desktop
    discord
    google-chrome
    stats
  ];
}
