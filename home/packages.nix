{ pkgs, ... }: {
  home.packages = with pkgs; [
    colima
    docker
    comma
    tldr
    parallel
    hyperfine
    (uutils-coreutils.override { prefix = ""; })
  ];
}
