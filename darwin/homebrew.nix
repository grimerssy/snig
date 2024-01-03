{ ... }: {
  homebrew = {
    enable = true;
    brews = [ "devcontainer" ];
    casks =
      [ "raycast" "pika" "alex313031-thorium" "telegram" "discord" "insomnia" ];
    onActivation.cleanup = "zap";
  };
}
