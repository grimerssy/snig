{ pkgs, ... }:
with pkgs; {
  programs.neovim = {
    extraPackages = [ delve ];
    plugins = with vimPlugins; [
      nvim-dap-ui
      nvim-dap-go
      {
        plugin = nvim-dap;
        type = "lua";
        config = builtins.readFile ./dap.lua;
      }
    ];
  };
}
