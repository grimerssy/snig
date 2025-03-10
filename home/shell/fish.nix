{ pkgs, ... }:
{
  programs.fish =
    let
      nvim = "nvim";
      tmux = "${pkgs.tmux}/bin/tmux";
    in
    {
      enable = true;
      shellAliases = {
        v = nvim;
        s = "tmux-session";
        a = "${tmux} attach";
        apply = "template init";
        nix-shell = "nix-shell --command fish";
      };
      shellInit = ''
        set fish_greeting
      '';
    };
}
