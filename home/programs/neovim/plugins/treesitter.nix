{ pkgs, ... }: {
  programs.neovim = with pkgs; {
    extraPackages = [ tree-sitter ];
    plugins = with vimPlugins; [
      nvim-treesitter.withAllGrammars
      nvim-ts-context-commentstring
    ];
  };
}
