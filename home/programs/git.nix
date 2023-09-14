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
        s = "status";
        c = "commit";
        ca = "commit --amend";
        p = "push";
        pf = "push --force";
        co = "checkout";
        l = "log --oneline --graph";
        b = "branch";
        m = "merge";
        rb = "rebase";
        rbi = "rebase -i";
        rbc = "rebase --continue";
        rs = "reset";
        rh = "reset --hard";
        rv = "revert";
      };
    };
  };
}
