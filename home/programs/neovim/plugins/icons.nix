{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [{
    plugin = nvim-web-devicons;
    type = "lua";
    config = builtins.readFile ./icons.lua;
  }];
}
