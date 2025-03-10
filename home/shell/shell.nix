{ pkgs, ... }:
{
  programs.bash.enable = true;
  programs.zsh.enable = true;
  home.shellAliases =
    let
      nvim = "nvim";
      tmux = "${pkgs.tmux}/bin/tmux";
    in
    {
      v = nvim;
      s = "tmux-session";
      a = "${tmux} attach";
      apply = "template init";
    };
}
