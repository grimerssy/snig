{ pkgs, ... }:
{
  home.packages = with pkgs; [
    comma
    jq
    fd
    xcp
    fzf
    tldr
    bottom
    httpie
    ffmpeg
    du-dust
    ripgrep
    nix-index
    yt-dlp

    docker
    # TODO https://github.com/LnL7/nix-darwin/pull/1275
    colima

    pika
    telegram-desktop
    discord
    google-chrome
  ];
}
