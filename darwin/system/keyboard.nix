{ ... }:
{
  system.keyboard = {
    enableKeyMapping = true;
    userKeyMapping =
      let
        capsLock = 30064771129;
        rctrl = 30064771300;
      in [{
        HIDKeyboardModifierMappingSrc = capsLock;
        HIDKeyboardModifierMappingDst = rctrl;
      }];
  };
}
