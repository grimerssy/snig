{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    catppuccin-nvim
    nvim-web-devicons
    nvim-navic
    {
      plugin = lualine-nvim;
      type = "lua";
      config = builtins.readFile ./lualine.lua;
    }
  ];
}
