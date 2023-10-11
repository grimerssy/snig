{ pkgs, ... }:
with pkgs; {
  programs.neovim = {
    extraPackages = [ ripgrep ];
    plugins = with vimPlugins; [
      plenary-nvim
      {
        plugin = telescope-nvim;
        type = "lua";
        config = builtins.readFile ./telescope.lua;
      }
    ];
  };
}
