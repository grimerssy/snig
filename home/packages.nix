{ pkgs, ... }: {
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
  ];
}
