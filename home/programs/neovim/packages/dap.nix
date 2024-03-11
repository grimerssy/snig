{pkgs, ...}: {
  programs.neovim = with pkgs; {
    extraPackages = [delve];
    plugins = with vimPlugins; [nvim-dap nvim-dap-ui nvim-dap-go];
  };
}
