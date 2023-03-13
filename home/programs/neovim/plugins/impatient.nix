{ pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = impatient-nvim;
      type = "lua";
      config = ''
        require("impatient").enable_profile()
      '';
    }
  ];
}
