{ ... }:
let
  wrapLuaConfig = luaConfig: ''
    lua<<EOF
    ${luaConfig}
    EOF
  '';
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraConfig = wrapLuaConfig ''
      require("config.settings")
      require("config.remap")
    '';
  };
  home.file = {
    ".config/nvim/after".source = ./after;
    ".config/nvim/lua/config".source = ./config;
  };
}
