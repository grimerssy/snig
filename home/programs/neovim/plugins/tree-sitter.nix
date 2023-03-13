{ pkgs, ... }:
with pkgs; {
  programs.neovim = {
    extraPackages = [ tree-sitter ];
    plugins = with vimPlugins; [
      playground
      nvim-ts-context-commentstring
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = ''
          require("nvim-treesitter.configs").setup({
            highlight = {
              enable = true;
              additional_vim_regex_highlighting = true,
            },
            indent = {
              enable = true,
              disable = { "yaml" }
            },
            context_commentstring = {
              enable = true,
            },
          })
        '';
      }
    ];
  };
}
