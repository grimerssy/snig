{ pkgs, ... }: {
  programs.fish = let
    nvim = "nvim";
    bat = "${pkgs.bat}/bin/bat";
    eza = "${pkgs.eza}/bin/eza";
    tldr = "${pkgs.tldr}/bin/tldr";
    tmux = "${pkgs.tmux}/bin/tmux";
    basename = "${pkgs.uutils-coreutils}/bin/uutils-basename";
  in {
    enable = true;
    shellAliases = rec {
      v = nvim;
      s = "tmux-session";
      a = "${tmux} attach";
      boy = tldr;
      cat = "${bat} --paging=never";
      ls =
        "${eza} -F --group-directories-first --no-user --no-time --color-scale --icons";
      ll = "${ls} -l";
      nix-shell = "nix-shell --command fish";
      dev =
        "docker compose -f .devcontainer/docker-compose.yaml -p $(${basename} $PWD)";
      devx = "dev exec -w /app app";
    };
    shellInit = ''
      set fish_greeting
    '';
    plugins = [{
      name = "nix-env.fish";
      src = pkgs.fetchFromGitHub {
        owner = "lilyball";
        repo = "nix-env.fish";
        rev = "7b65bd228429e852c8fdfa07601159130a818cfa";
        sha256 = "069ybzdj29s320wzdyxqjhmpm9ir5815yx6n522adav0z2nz8vs4";
      };
    }];
  };
}
