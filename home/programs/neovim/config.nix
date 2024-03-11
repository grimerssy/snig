{...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraConfig = "lua require('configs')";
  };
  home.file = {
    ".config/nvim/lua/configs".source = ./configs;
    ".config/nvim/after/ftplugin".source = ./ftplugin;
  };
}
