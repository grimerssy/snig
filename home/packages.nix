{ pkgs, ... }: {
  home.packages = with pkgs; [
    comma
    fd
    xcp
    bottom
    curlie
    ffmpeg
    du-dust
    ripgrep
    nix-index
    (uutils-coreutils.override { prefix = ""; })
  ];
}
