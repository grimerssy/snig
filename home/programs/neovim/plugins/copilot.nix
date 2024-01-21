{ pkgs, ... }: {
  programs.neovim = with pkgs; {
    extraPackages = [ nodejs ];
    plugins = with vimPlugins; [ copilot-lua ];
  };
}
