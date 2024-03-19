{ pkgs, ... }: {
  programs.neovim = with pkgs; {
    extraPackages = [
      typos-lsp
      vscode-langservers-extracted # jsonls
      tailwindcss-language-server
      dockerfile-language-server-nodejs
      nodePackages.bash-language-server
      ccls
      nil
      nixpkgs-fmt
      lua-language-server
      go
      nodePackages.typescript-language-server
      cargo
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
