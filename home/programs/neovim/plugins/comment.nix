{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    nvim-ts-context-commentstring
    {
      plugin = comment-nvim;
      type = "lua";
      config = builtins.readFile ./comment.lua;
    }
  ];
}
