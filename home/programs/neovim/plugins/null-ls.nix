{ pkgs, ... }: {
  programs.neovim = {
    extraPackages = with pkgs; [
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
    plugins = with pkgs.vimPlugins; [{
      plugin = none-ls-nvim;
      type = "lua";
      config = builtins.readFile ./null-ls.lua;
    }];
  };
}
