{ lib, inputs, ... }:
{
  nix = {
    optimise.automatic = true;
    # TODO remove self
    registry = lib.mapAttrs (_: flake: { inherit flake; }) inputs;
    # TODO
    # nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    settings = {
      flake-registry = "";
      experimental-features = "nix-command flakes";
      # TODO
      # Workaround for https://github.com/NixOS/nix/issues/9574
      # nix-path = config.nix.nixPath;
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
  };
}
