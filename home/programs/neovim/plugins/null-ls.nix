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
      config = builtins.readFile ./null-ls.lua;
    }];
  };
}
