{ pkgs, ... }: {
  programs.fish = let
    nvim = "nvim";
    fd = "${pkgs.fd}/bin/fd";
    bat = "${pkgs.bat}/bin/bat";
    eza = "${pkgs.eza}/bin/eza";
    xcp = "${pkgs.xcp}/bin/xcp";
    rg = "${pkgs.ripgrep}/bin/rg";
    btm = "${pkgs.bottom}/bin/btm";
    tmux = "${pkgs.tmux}/bin/tmux";
    dust = "${pkgs.du-dust}/bin/dust";
  in {
    enable = true;
    shellAliases = {
      v = nvim;
      s = "tmux-session";
      a = "${tmux} attach";
      cp = xcp;
      top = btm;
      du = dust;
      find = fd;
      grep = rg;
      cat = "${bat} --paging=never";
      ls =
        "${eza} -lF --group-directories-first --no-user --no-time --color-scale --icons";
      nix-shell = "nix-shell --command fish";
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
