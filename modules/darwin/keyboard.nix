{ config, lib, ... }:

with lib;

let
  cfg = config.system.keyboard;
in

{
  options = {
    system.keyboard.remapCapsLockToRightControl = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to remap the Caps Lock key to right Control.";
    };
  };

  config = {
    system.keyboard.userKeyMapping = optional cfg.remapCapsLockToRightControl {
      HIDKeyboardModifierMappingSrc = 30064771129;
      HIDKeyboardModifierMappingDst = 30064771300;
    };
  };
}
