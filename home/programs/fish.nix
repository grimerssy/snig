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
      plugins = [
        {
          name = "nix-env.fish";
          src = pkgs.fetchFromGitHub {
            owner = "lilyball";
            repo = "nix-env.fish";
            rev = "7b65bd228429e852c8fdfa07601159130a818cfa";
            sha256 = "069ybzdj29s320wzdyxqjhmpm9ir5815yx6n522adav0z2nz8vs4";
          };
        }
      ];
    };
}
