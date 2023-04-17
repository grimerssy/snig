{ ... }: {
  programs.git = {
    enable = true;
    userName = "grimerssy";
    userEmail = "grimerssy@gmail.com";
    delta.enable = true;
    ignores = [ "**/.direnv/" "**/.DS_Store" ];
    extraConfig = {
      pull = { ff = "only"; };
      init.defaultBranch = "main";
      format.pretty = "oneline";
    };
  };
}
