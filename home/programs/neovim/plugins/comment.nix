{ pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    nvim-ts-context-commentstring
    {
      plugin = comment-nvim;
      type = "lua";
      config = ''
        require("Comment").setup({
          toggler = {
            line = "gcc",
            block = "gbc",
          },
          pre_hook = function(ctx)
            if vim.bo.filetype == "typescriptreact" then
              local U = require("Comment.utils")

              local type = ctx.ctype == U.ctype.linewise and "__default" or "__multiline"

              local location = nil
              if ctx.ctype == U.ctype.blockwise then
                location = require("ts_context_commentstring.utils").get_cursor_location()
              elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                location = require("ts_context_commentstring.utils").get_visual_start_location()
              end

              return require("ts_context_commentstring.internal").calculate_commentstring({
                key = type,
                location = location,
              })
            end
          end,
        })
      '';
    }
  ];
}
