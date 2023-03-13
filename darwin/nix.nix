{ ... }:
{
  services.nix-daemon.enable = true;
  nix = {
    readOnlyStore = true;
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
    extraOptions = ''
      build-users-group = nixbld
      experimental-features = nix-command flakes
    '';
  };
}
