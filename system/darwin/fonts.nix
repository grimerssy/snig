{ pkgs, ... }:
let
  fonts = [ "JetBrainsMono" ];
in
{
  fonts = {
    packages = [ (pkgs.nerdfonts.override { inherit fonts; }) ];
  };
}
