{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    cmp-buffer
    cmp-path
    cmp-cmdline
    cmp_luasnip
    luasnip
    cmp-nvim-lsp
    cmp-nvim-lua
    {
      plugin = nvim-cmp;
      type = "lua";
      config = builtins.readFile ./cmp.lua;
    }
  ];
}
