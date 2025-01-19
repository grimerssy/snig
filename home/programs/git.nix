{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Stanislav Stoyanov";
    userEmail = "grimerssy@gmail.com";
    delta.enable = true;
    signing = {
      key = null;
      signByDefault = true;
    };
    extraConfig = {
      core.editor = "nvim";
      pull = {
        ff = "only";
      };
      init.defaultBranch = "main";
      format.pretty = "oneline";
    };
  };
}
