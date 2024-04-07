{ pkgs, ... }: {
  home.file.".config/nvim/lua/configs".source = ./configs;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraConfig = "lua require('configs')";
    extraPackages = with pkgs; [
      ripgrep

      tree-sitter

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
      delve

      nodePackages.typescript-language-server

      cargo
      texlab
      tectonic
    ];
    plugins = with pkgs.vimPlugins; [
      oil-nvim

      plenary-nvim
      telescope-nvim

      harpoon

      gitsigns-nvim

      nvim-treesitter.withAllGrammars
      nvim-ts-context-commentstring

      comment-nvim

      nvim-cmp
      cmp-buffer
      cmp-path
      cmp_luasnip
      cmp-nvim-lsp
      cmp-nvim-lua
      lspkind-nvim

      lsp-zero-nvim
      nvim-lspconfig

      crates-nvim

      nvim-dap
      nvim-dap-ui
      nvim-dap-go

      luasnip
      friendly-snippets

      catppuccin-nvim
      lualine-nvim
      dressing-nvim
      nvim-notify
      nvim-scrollbar
      nvim-web-devicons
    ];
  };
}
