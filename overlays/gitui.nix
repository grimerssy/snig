self: super: {
  gitui = super.gitui.overrideAttrs (old: rec {
    src = super.fetchFromGitHub {
      owner = "hendrikmaus";
      repo = "gitui";
      rev = "gpg-commit-signing";
      sha256 = "sha256-zAywvg5/VcRTiR64wEXUy4YymTwAUBKw26X4Pvgsa2k=";
    };
    doCheck = false;
    cargoDeps = old.cargoDeps.overrideAttrs (_: {
      inherit src;
      outputHash = "sha256-9Xi83LkBD/CpOmZ902ZeaFQjBhs5vUURn9eO7NjmvlQ=";
    });
  });
}
