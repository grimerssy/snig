{...}: self: super: {
  alacritty = super.alacritty.overrideAttrs (old: rec {
    src = super.fetchFromGitHub {
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
}
