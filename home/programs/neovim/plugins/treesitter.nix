{ pkgs, ... }:
with pkgs; {
  programs.neovim = {
    extraPackages = [ tree-sitter ];
    plugins = with vimPlugins; [
      nvim-ts-context-commentstring
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = builtins.readFile ./treesitter.lua;
      }
    ];
  };
}
