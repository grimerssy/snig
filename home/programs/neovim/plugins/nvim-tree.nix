{ pkgs, ... }:
with pkgs; {
  programs.neovim = {
    extraPackages = [ trash-cli ];
    plugins = with vimPlugins; [
      nvim-web-devicons
      {
        plugin = nvim-tree-lua;
        type = "lua";
        config = builtins.readFile ./nvim-tree.lua;
      }
    ];
  };
}
