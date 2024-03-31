{ ... }: {
  homebrew = {
    enable = true;
    casks = [
      "docker"
      "pika"
      "alex313031-thorium"
      "telegram"
      "discord"
      "insomnia"
    ];
    onActivation.cleanup = "zap";
  };
}
