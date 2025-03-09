{ ... }:
{
  # TODO fix in 25.05
  security.pam = {
    enableSudoTouchIdAuth = true;
    enablePamReattach = true;
  };
}
