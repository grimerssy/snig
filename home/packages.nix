{ pkgs, ... }: {
  home.packages = with pkgs; [
    comma
    jq
    fd
    xcp
    tldr
    bottom
    httpie
    ffmpeg
    du-dust
    ripgrep
    nix-index
    (uutils-coreutils.override { prefix = ""; })
  ];
}
