{ pkgs, ... }: {
  home.packages = with pkgs; [
    comma
    jq
    fd
    xcp
    bottom
    httpie
    ffmpeg
    du-dust
    ripgrep
    nix-index
    (uutils-coreutils.override { prefix = ""; })
  ];
}
