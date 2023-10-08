{ pkgs, ... }: {
  home.packages = with pkgs; [
    colima
    docker
    comma
    tldr
    parallel
    hyperfine
    tectonic
    nix-index
    (uutils-coreutils.override { prefix = ""; })
  ];
}
