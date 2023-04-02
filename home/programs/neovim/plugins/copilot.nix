{ pkgs, ... }:
with pkgs; {
  programs.neovim = {
    extraPackages = [ nodejs ];
    plugins = with vimPlugins; [ copilot-vim ];
  };
}
