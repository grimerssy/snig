{...}: self: super: {
  vimPlugins =
    super.vimPlugins
    // {
      # TODO: remove in 24.05
      catppuccin-nvim = super.unstable.vimPlugins.catppuccin-nvim;
    };
}
