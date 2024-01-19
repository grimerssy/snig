{ ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  home.file = {
    ".config/nvim/after".source = ./after;
    ".config/nvim/lua/config".source = ./config; # TODO: remove /config
  };
}
