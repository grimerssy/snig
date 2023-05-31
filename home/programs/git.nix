{ ... }: {
  programs.git = {
    enable = true;
    userName = "grimerssy";
    userEmail = "grimerssy@gmail.com";
    delta.enable = true;
    ignores = [ "**/.direnv/" "**/.DS_Store" ];
    extraConfig = {
      core.editor = "nvim";
      pull = { ff = "only"; };
      init.defaultBranch = "main";
      format.pretty = "oneline";
      alias = {
        c = "commit -m";
        s = "status";
        m = "merge";
        b = "branch";
        l = "log --oneline --graph";
        co = "checkout";
        ca = "commit --amend -m";
        rv = "revert";
        rb = "rebase";
        rs = "reset";
        rh = "reset --hard";
      };
    };
  };
}
