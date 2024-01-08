{ ... }: {
  homebrew = {
    enable = true;
    brews = [ "devcontainer" ];
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
