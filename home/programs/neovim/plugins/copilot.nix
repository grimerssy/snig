{ pkgs, ... }:
with pkgs; {
  programs.neovim = {
    extraPackages = [ nodejs ];
    plugins = with vimPlugins; [{
      plugin = copilot-vim;
      type = "lua";
      config = ''
        local n = require("config.keymap").nnoremap

        vim.g.copilot_enabled = false

        n("<leader>ce", function()
          vim.cmd("Copilot enable")
          vim.notify("Copilot enabled")
        end)

        n("<leader>cd", function()
          vim.cmd("Copilot disable")
          vim.notify("Copilot disabled")
        end)
      '';
    }];
  };
}
