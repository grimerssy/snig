{ ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  home.file = {
    ".config/nvim/plugin".source = ./init;
    ".config/nvim/after/plugin".source = ./after;
    ".config/nvim/after/ftplugin".source = ./filetype;
  };
}
