{ inputs, ... }:
{
  imports = [
    inputs.treefmt-nix.flakeModule
  ];
  perSystem.treefmt = {
    projectRootFile = "flake.nix";
    programs.nixfmt.enable = true;
    programs.stylua.enable = true;
    programs.keep-sorted.enable = true;
    programs.deno = {
      enable = true;
      includes = [ "*.md" ];
    };
    settings.global.excludes = [
      ".editorconfig"
      "assets/*"
    ];
  };
}
