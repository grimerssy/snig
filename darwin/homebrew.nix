{ ... }: {
  homebrew = {
    enable = true;
    casks = [ "pika" "alex313031-thorium" "telegram" "discord" "insomnia" ];
    onActivation.cleanup = "zap";
  };
}
