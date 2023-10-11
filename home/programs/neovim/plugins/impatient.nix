{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [{
    plugin = impatient-nvim;
    type = "lua";
    config = builtins.readFile ./impatient.lua;
  }];
}
