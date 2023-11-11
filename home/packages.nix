{ pkgs, ... }: {
  home.packages = with pkgs; [
    colima
    docker
    comma
    parallel
    watchexec
    cpulimit
    hyperfine
    flyctl
    tectonic
    nix-index
    (uutils-coreutils.override { prefix = ""; })
  ];
}
