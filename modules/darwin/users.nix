{ config, lib, ... }:

with lib;

let
  cfg = config.users;
in

{
  config.users.users = genAttrs cfg.normalUsers (name: {
    home = mkDefault "/Users/${name}";
    createHome = mkDefault true;
    isHidden = mkDefault false;
  });
}
