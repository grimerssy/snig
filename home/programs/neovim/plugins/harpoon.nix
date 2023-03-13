{ pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = harpoon;
      type = "lua";
      config = ''
        local n = require("config.keymap").nnoremap
        local harpoon, harpoon_ui = require("harpoon.mark"), require("harpoon.ui")

        n("<leader>m", harpoon.add_file)
        n("<leader>mm", harpoon_ui.toggle_quick_menu)

        local function nav_file(file)
          return function()
            harpoon_ui.nav_file(file)
          end
        end

        n("<S-h>", nav_file(1))
        n("<S-j>", nav_file(2))
        n("<S-k>", nav_file(3))
        n("<S-l>", nav_file(4))
      '';
    }
  ];
}
