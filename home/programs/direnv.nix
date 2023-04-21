{ pkgs, ... }: {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    stdlib = let
      cut = "${pkgs.coreutils}/bin/cut";
      sha256sum = "${pkgs.coreutils}/bin/sha256sum";
      basename = "${pkgs.coreutils}/bin/basename";
    in ''
      : ''${XDG_CACHE_HOME:=$HOME/.cache}
      declare -A direnv_layout_dirs
      direnv_layout_dir () {
        echo "''${direnv_layout_dirs[$PWD]:=$(
          local hash=$(echo $PWD | ${sha256sum} | ${cut} -c-8)
          echo "$XDG_CACHE_HOME/direnv/layouts/$(${basename} $PWD)-$hash"
        )}"
      }
    '';
  };
  home.sessionVariables.DIRENV_LOG_FORMAT = "";
}
