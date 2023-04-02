{ ... }: {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    stdlib = ''
      : ''${XDG_CACHE_HOME:=$HOME/.cache}
      declare -A direnv_layout_dirs
      direnv_layout_dir () {
        echo "''${direnv_layout_dirs[$PWD]:=$(
          local hash=$(echo $PWD | shasum | cut -c-8)
          echo "$XDG_CACHE_HOME/direnv/layouts/$(basename $PWD)-$hash"
        )}"
      }
    '';
  };
}
