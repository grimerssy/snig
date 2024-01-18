{ pkgs, ... }:
with pkgs; {
  programs.neovim = {
    extraPackages = [
      shellcheck
      nixfmt
      stylua
      nodePackages.prettier
      rustfmt
      gofumpt
      gotools
      go-tools
      jq
      buf
      elixir
      black
      djhtml
      rustywind
      codespell
    ];
    plugins = with vimPlugins; [{
      plugin = none-ls-nvim;
      type = "lua";
      config = builtins.readFile ./null-ls.lua;
    }];
  };
}
