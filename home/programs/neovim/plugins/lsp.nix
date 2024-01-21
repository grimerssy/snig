{ pkgs, ... }: {
  programs.neovim = with pkgs; {
    extraPackages = [
      nil
      ltex-ls
      rust-bin.stable.latest.default
      rust-analyzer
      clippy
      go
      gopls
      clang-tools
      lua-language-server
      vscode-langservers-extracted
      nodePackages.bash-language-server
      nodePackages.typescript-language-server
      nodePackages."@tailwindcss/language-server"
    ];
    plugins = with vimPlugins; [
      lsp-zero-nvim
      nvim-lspconfig

      nvim-cmp
      cmp-buffer
      cmp-path
      cmp_luasnip
      cmp-nvim-lsp
      cmp-nvim-lua

      lspkind-nvim

      luasnip
      friendly-snippets
    ];
  };
}
