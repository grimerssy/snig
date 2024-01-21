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
      sourcekit-lsp
      elixir_ls
      pyright
      clang-tools
      # lua-language-server
      jdt-language-server
      omnisharp-roslyn
      nodePackages.bash-language-server
      nodePackages.svelte-language-server
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

      # rust-tools-nvim
    ];
  };
}
