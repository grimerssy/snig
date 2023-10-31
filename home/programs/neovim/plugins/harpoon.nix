{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [{
    plugin = harpoon;
    type = "lua";
    config = builtins.readFile ./harpoon.lua;
  }];
}
