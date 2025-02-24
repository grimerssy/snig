{ ... }:
{
  security.pam = {
    enableSudoTouchIdAuth = true;
    enablePamReattach = true;
  };
}
