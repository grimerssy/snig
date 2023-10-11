{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    friendly-snippets
    {
      plugin = luasnip;
      type = "lua";
      config = builtins.readFile ./luasnip.lua;
    }
  ];
}
