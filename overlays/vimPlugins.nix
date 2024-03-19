{...}: self: super: {
  vimPlugins =
    super.vimPlugins
    // {
      # TODO: remove in 24.05
      catppuccin-nvim = super.unstable.vimPlugins.catppuccin-nvim;
      nvim-lspconfig = super.unstable.vimPlugins.nvim-lspconfig;
    };
}
