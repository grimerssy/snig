self: super: {
  vimPlugins = super.vimPlugins // {
    nvim-tree-lua = super.vimPlugins.nvim-tree-lua.overrideAttrs (old: {
      src = super.fetchFromGitHub {
        owner = "nvim-tree";
        repo = "nvim-tree.lua";
        rev = "e8a89db1bbc06510a76fc935754b4e99a3e5e8a7";
        sha256 = "1hhcayk60whd88d3nfhig00qjqx0h3shssl8xvhr7m8lkrkysigb";
      };
    });
  };
}
