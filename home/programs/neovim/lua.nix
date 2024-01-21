{ ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraConfig = ''
      let mapleader = " "
    '';
  };
  home.file = { ".config/nvim/after".source = ./after; };
}
