{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    catppuccin-nvim
    {
      plugin = nvim-scrollbar;
      type = "lua";
      config = builtins.readFile ./scrollbar.lua;
    }
  ];
}
