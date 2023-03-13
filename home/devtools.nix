{ pkgs, ... }:
{
  home = {
    sessionVariables = {
      RUSTC_WRAPPER = "${pkgs.sccache}/bin/sccache";
      GOPATH = "$HOME/.go";
    };
  };
}
