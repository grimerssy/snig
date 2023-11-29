{ pkgs, ... }: {
  home.packages = with pkgs; [
    colima
    docker
    comma
    parallel
    watchexec
    cpulimit
    ffmpeg
    hyperfine
    vhs
    pop
    gum
    glow
    flyctl
    tectonic
    nix-index
    (uutils-coreutils.override { prefix = ""; })
  ];
}
