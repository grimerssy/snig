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
      nvim-lspconfig
      nvim-cmp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp_luasnip
      cmp-nvim-lsp
      cmp-nvim-lua
      rust-tools-nvim
    ];
  };
}
