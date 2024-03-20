{ pkgs, ... }:
let
  fonts = [ "JetBrainsMono" ];
in
{
  fonts = {
    fontDir.enable = true;
    fonts = [
      (pkgs.nerdfonts.override { inherit fonts; })
    ];
  };
}
