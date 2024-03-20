{ pkgs, ... }: {
  programs.neovim = with pkgs; {
    plugins = with vimPlugins; [
      oil-nvim

      harpoon

      comment-nvim

      gitsigns-nvim

      catppuccin-nvim
      lualine-nvim
      dressing-nvim
      nvim-notify
      nvim-scrollbar
      nvim-web-devicons
    ];
  };
}
