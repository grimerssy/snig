{ pkgs, ... }: {
  programs.neovim = {
    extraPackages = with pkgs; [
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
    plugins = with pkgs.vimPlugins; [
      rust-tools-nvim
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = builtins.readFile ./lsp.lua;
      }
    ];
  };
}
