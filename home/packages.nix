{ pkgs, ... }: {
  home.packages = with pkgs; [
    colima
    docker
    comma
    tldr
    parallel
    watchexec
    cpulimit
    hyperfine
    tectonic
    nix-index
    (uutils-coreutils.override { prefix = ""; })
  ];
}
