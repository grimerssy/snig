{
  user,
  lib,
  pkgs,
  ...
}: {
  system.activationScripts.postActivation.text = ''
    sudo chsh -s ${lib.getBin pkgs.fish}/bin/fish ${user}
  '';
}
