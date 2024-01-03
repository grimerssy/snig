{ pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty.overrideAttrs (old: rec {
      src = pkgs.fetchFromGitHub {
        owner = "grimerssy";
        repo = "alacritty";
        rev = "ligature";
        sha256 = "sha256-9+Znlmrz0pSifprX5TbAi502wArEuyB4ggTeB519tng=";
      };
      doCheck = false;
      cargoDeps = old.cargoDeps.overrideAttrs (_: {
        inherit src;
        outputHash = "sha256-Z1clvuuvj1uHn/aXjfWgWEeaJALhygsShF225FuoW/4=";
      });
      # old script from the version of ligature fork
      # will not work on linux
      postInstall = ''
        mkdir $out/Applications
        cp -r extra/osx/Alacritty.app $out/Applications
        ln -s $out/bin $out/Applications/Alacritty.app/Contents/MacOS
        installShellCompletion --zsh extra/completions/_alacritty
        installShellCompletion --bash extra/completions/alacritty.bash
        installShellCompletion --fish extra/completions/alacritty.fish

        install -dm 755 "$out/share/man/man1"
        gzip -c extra/alacritty.man > "$out/share/man/man1/alacritty.1.gz"

        install -Dm 644 alacritty.yml $out/share/doc/alacritty.yml

        install -dm 755 "$terminfo/share/terminfo/a/"
        tic -xe alacritty,alacritty-direct -o "$terminfo/share/terminfo" extra/alacritty.info
        mkdir -p $out/nix-support
        echo "$terminfo" >> $out/nix-support/propagated-user-env-packages
      '';
    });
    settings = {
      cursor.style.blinking = "Never";
      font = {
        size = 17;
        ligatures = true;
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
        offset = {
          x = 0;
          y = 0;
        };
        glyph_offset = {
          x = 0;
          y = 0;
        };
      };
      window = {
        opacity = 1;
        dimensions = {
          columns = 200;
          lines = 80;
        };
        padding = {
          x = 15;
          y = 15;
        };
        history = 10000;
        decorations = "buttonless";
        semantic_escape_chars = "',│`|:\"'' ()[]{}<>'";
        save_to_clipboard = true;
        live_config_reload = true;
      };

      key_bindings = [
        {
          key = "V";
          mods = "Control|Shift";
          action = "Paste";
        }
        {
          key = "C";
          mods = "Control|Shift";
          action = "Copy";
        }
        {
          key = "Return";
          mods = "Control";
          action = "ResetFontSize";
        }
        {
          key = "Equals";
          mods = "Control";
          action = "IncreaseFontSize";
        }
        {
          key = "Minus";
          mods = "Control";
          action = "DecreaseFontSize";
        }
      ];
      colors = {
        primary = {
          background = "#303446";
          foreground = "#C6D0F5";
          dim_foreground = "#C6D0F5";
          bright_foreground = "#C6D0F5";
        };
        cursor = {
          text = "#303446";
          cursor = "#F2D5CF";
        };
        vi_mode_cursor = {
          text = "#303446";
          cursor = "#BABBF1";
        };
        search = {
          matches = {
            foreground = "#303446";
            background = "#A5ADCE";
          };
          focused_match = {
            foreground = "#303446";
            background = "#A6D189";
          };
          footer_bar = {
            foreground = "#303446";
            background = "#A5ADCE";
          };
        };
        hints = {
          start = {
            foreground = "#303446";
            background = "#E5C890";
          };
          end = {
            foreground = "#303446";
            background = "#A5ADCE";
          };
        };
        selection = {
          text = "#303446";
          background = "#F2D5CF";
        };
        normal = {
          black = "#51576D";
          red = "#E78284";
          green = "#A6D189";
          yellow = "#E5C890";
          blue = "#8CAAEE";
          magenta = "#F4B8E4";
          cyan = "#81C8BE";
          white = "#B5BFE2";
        };
        bright = {
          black = "#626880";
          red = "#E78284";
          green = "#A6D189";
          yellow = "#E5C890";
          blue = "#8CAAEE";
          magenta = "#F4B8E4";
          cyan = "#81C8BE";
          white = "#A5ADCE";
        };
        dim = {
          black = "#51576D";
          red = "#E78284";
          green = "#A6D189";
          yellow = "#E5C890";
          blue = "#8CAAEE";
          magenta = "#F4B8E4";
          cyan = "#81C8BE";
          white = "#B5BFE2";
        };
        indexed_colors = [
          {
            index = 16;
            color = "#EF9F76";
          }
          {
            index = 17;
            color = "#F2D5CF";
          }
        ];
      };
    };
  };
}
