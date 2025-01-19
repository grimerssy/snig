{ ... }:
{
  # TODO https://github.com/LnL7/nix-darwin/pull/1020
  disabledModules = [ "security/pam.nix" ];
  imports = [ ../modules/security/pam.nix ];
  security.pam = {
    enableSudoTouchIdAuth = true;
    enablePamReattach = true;
  };
}
