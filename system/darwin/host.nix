{ host, ... }:
{
  networking = {
    hostName = host;
    computerName = host;
  };
}
