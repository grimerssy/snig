{ pkgs, ... }: {
  programs.neovim = with pkgs; {
    extraPackages = [
      nil
      lua-language-server
      go
      cargo
      ltex-ls
      vscode-langservers-extracted # jsonls
      nodePackages.bash-language-server
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

      crates-nvim
    ];
  };
}
