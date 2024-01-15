{ ... }: {
  homebrew = {
    enable = true;
    brews = [ ];
    casks =
      [ "docker" "pika" "alex313031-thorium" "telegram" "discord" "insomnia" ];
    onActivation.cleanup = "zap";
  };
}
