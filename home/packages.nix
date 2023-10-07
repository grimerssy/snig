{ pkgs, ... }: {
  home.packages = with pkgs; [
    colima
    docker
    comma
    tldr
    parallel
    hyperfine
    tectonic
    (uutils-coreutils.override { prefix = ""; })
  ];
}
