{ pkgs, ... }: {
  programs.mcfly = {
    enable = true;
    enableFishIntegration = false;
  };
  programs.fish.shellInit = ''
    set -gx MCFLY_FUZZY 3
    set -gx MCFLY_KEY_SCHEME vim
    ${pkgs.mcfly}/bin/mcfly init fish | source
  '';
}
