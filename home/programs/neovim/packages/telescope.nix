{ pkgs, ... }: {
  programs.neovim = with pkgs; {
    extraPackages = [ ripgrep ];
    plugins = with vimPlugins; [ plenary-nvim telescope-nvim ];
  };
}
