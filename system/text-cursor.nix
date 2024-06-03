{ ... }: {
  # TODO can become an option in nix-darwin
  system.activationScripts.postActivation.text = ''
    sudo defaults write /Library/Preferences/FeatureFlags/Domain/UIKit.plist redesigned_text_cursor -dict-add Enabled -bool NO
  '';
}

