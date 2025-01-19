{ ... }:
{
  homebrew = {
    enable = true;
    casks = [
      "docker"
      "alex313031-thorium"
    ];
    onActivation.cleanup = "zap";
  };
}
