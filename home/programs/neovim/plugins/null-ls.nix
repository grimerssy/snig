{ pkgs, ... }: {
  programs.neovim = {
    extraPackages = with pkgs; [
      codespell
      rustfmt
      gofumpt
      go-tools
      gotools
      nixfmt
      stylua
      shellcheck
      elixir
      black
      jq
      buf
      nodePackages.prettier
    ];
    plugins = with pkgs.vimPlugins; [{
      plugin = null-ls-nvim;
      type = "lua";
      config = ''
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        local code_actions = null_ls.builtins.code_actions

        null_ls.setup({
          sources = {
            code_actions.shellcheck,
            formatting.nixfmt,
            formatting.stylua,
            formatting.prettier,
            formatting.jq,
            formatting.goimports,
            formatting.gofumpt,
            formatting.buf,
            formatting.rustfmt,
            formatting.mix,
            formatting.black,
            diagnostics.codespell.with({
              extra_args = {
                "--check-filenames",
                "--ignore-words-list",
                "crate",
              },
            }),
            diagnostics.staticcheck,
            diagnostics.buf,
          },
          on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
              local n = require("config.keymap").nnoremap
              n("<leader>;", function ()
                vim.lsp.buf.format({ bufnr = bufnr })
              end)
            end
          end,
        })
      '';
    }];
  };
}
