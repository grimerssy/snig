{ ... }: {
  programs.git = {
    enable = true;
    userName = "Stanislav Stoyanov";
    userEmail = "grimerssy@gmail.com";
    delta.enable = true;
    ignores = [ "**/.direnv/" "**/.DS_Store" ];
    signing = {
      key = null;
      signByDefault = true;
    };
    aliases = {
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
    extraConfig = {
      core.editor = "nvim";
      pull = { ff = "only"; };
      init.defaultBranch = "main";
      format.pretty = "oneline";
    };
  };
}
