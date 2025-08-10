{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      terminal.shell.program = "${pkgs.fish}/bin/fish";
      font.normal.family = "JetBrainsMono Nerd Font";
      window.decorations = "none";
    };
  };
}
