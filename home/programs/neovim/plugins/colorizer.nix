{ pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-colorizer-lua;
      type = "lua";
      config = ''
        require("colorizer").setup({
          filetypes = {
            "*",
            "!TelescopePrompt",
            "!NvimTree",
          },
          user_default_options = {
            RGB = true,
            RRGGBB = true,
            names = false,
            RRGGBBAA = true,
            rgb_fn = true,
            hsl_fn = true,
            css = false,
            css_fn = true,
            mode = "background",
          },
        })
      '';
    }
  ];
}
