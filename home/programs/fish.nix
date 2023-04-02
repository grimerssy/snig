{ pkgs, ... }: {
  programs.fish = let
    nvim = "nvim";
    fd = "${pkgs.fd}/bin/fd";
    fzf = "${pkgs.fzf}/bin/fzf";
    bat = "${pkgs.bat}/bin/bat";
    exa = "${pkgs.exa}/bin/exa";
    xcp = "${pkgs.xcp}/bin/xcp";
    rg = "${pkgs.ripgrep}/bin/rg";
    btm = "${pkgs.bottom}/bin/btm";
    tmux = "${pkgs.tmux}/bin/tmux";
    dust = "${pkgs.du-dust}/bin/dust";
    zoxide = "${pkgs.zoxide}/bin/zoxide";
  in {
    enable = true;
    shellAliases = {
      v = nvim;
      s = "fish -c '__tmux-session $argv'";
      a = "${tmux} attach";
      cp = xcp;
      top = btm;
      du = dust;
      find = fd;
      grep = rg;
      cat = "${bat} --paging=never";
      ls =
        "${exa} -lF --group-directories-first --no-user --no-time --color-scale --icons";
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
    functions = {
      restart-services = ''
        launchctl unload "$HOME/Library/LaunchAgents/org.nixos.skhd.plist"
        launchctl unload "$HOME/Library/LaunchAgents/org.nixos.yabai.plist"
        launchctl load "$HOME/Library/LaunchAgents/org.nixos.skhd.plist"
        launchctl load "$HOME/Library/LaunchAgents/org.nixos.yabai.plist"
      '';
      __tmux-session = ''
        set ZOXIDE_RESULT (${zoxide} query $argv)

        if test (count $argv) -eq 0; or not set -q ZOXIDE_RESULT[1]
          set ZOXIDE_RESULT (${zoxide} query -l | ${fzf} --reverse)
        end

        if not set -q ZOXIDE_RESULT[1]
          exit 0
        end

        set SESSION (\
          basename $ZOXIDE_RESULT | string replace "." "-" \
          )-(echo $ZOXIDE_RESULT | shasum | cut -c-8)

        set EXISTING_SESSION (${tmux} list-sessions \
          | ${rg} "$SESSION" \
          | awk '{print $1}' \
          | string replace ":" "")

        if not set -q EXISTING_SESSION[1]
            cd $ZOXIDE_RESULT; \
              and ${tmux} new-session -d -s $SESSION; \
              and ${tmux} send-keys -t $SESSION:1 "${nvim} ." Enter
        end

        if not set -q TMUX
            ${tmux} attach -t $EXISTING_SESSION
            exit 0
        end

        ${tmux} switch-client -t $SESSION
      '';
    };
  };
}
