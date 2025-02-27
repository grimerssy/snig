{
  lib,
  pkgs,
  ...
}:
{
  system.activationScripts.postActivation.text = ''
    # TODO                                        vvvvvvvvv
    sudo chsh -s ${lib.getBin pkgs.fish}/bin/fish grimerssy
  '';
}
