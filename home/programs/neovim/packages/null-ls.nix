{ pkgs, ... }: {
  programs.neovim = with pkgs; {
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
    plugins = with vimPlugins; [ none-ls-nvim ];
  };
}
