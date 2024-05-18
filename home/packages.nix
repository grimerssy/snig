{ pkgs, ... }: {
  home.packages = with pkgs; [
    comma
    fd
    xcp
    bottom
    ffmpeg
    du-dust
    ripgrep
    nix-index
    (uutils-coreutils.override { prefix = ""; })
  ];
}
