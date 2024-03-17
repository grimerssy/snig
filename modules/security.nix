{
  config,
  pkgs,
  ...
}: let
  sudoFile = "/etc/pam.d/sudo";
  sudoTouchIdOption = "security.pam.enableSudoTouchIdAuth";
  sed = "${pkgs.gnused}/bin/sed";
  pamReattach = "${pkgs.pam-reattach}/lib/pam/pam_reattach.so";
  auth = ''
    auth       optional       ${pamReattach} # nix-darwin: ${sudoTouchIdOption}\
    auth       sufficient     pam_tid.so # nix-darwin: ${sudoTouchIdOption}
  '';
  enableAuth = ''
    if ! grep '${sudoTouchIdOption}' ${sudoFile} > /dev/null; then
      ${sed} -i '2i\${auth}' ${sudoFile}
    fi
  '';
  disableAuth = ''
    if grep '${sudoTouchIdOption}' ${sudoFile} > /dev/null; then
      ${sed} -i '/${sudoTouchIdOption}/d' ${sudoFile}
    fi
  '';
in {
  config = {
    system.activationScripts.extraActivation.text = ''
      echo >&2 "setting up pam..."
      ${
        if config.security.pam.enableSudoTouchIdAuth
        then enableAuth
        else disableAuth
      }
    '';
  };
}
