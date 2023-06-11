{ ... }: {
  services.nix-daemon.enable = true;
  nix = {
    readOnlyStore = true;
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
