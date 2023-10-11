{ pkgs, ... }:
with pkgs; {
  programs.neovim = {
    extraPackages = [ nodejs ];
    plugins = with vimPlugins; [{
      plugin = copilot-vim;
      type = "lua";
      config = builtins.readFile ./copilot.lua;
    }];
  };
}
