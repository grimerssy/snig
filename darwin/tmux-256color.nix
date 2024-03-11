{user, ...}: {
  system.activationScripts.postActivation.text = ''
    if [ ! -f /Users/${user}/.terminfo/74/tmux-256color ]; then
      curl -LO https://invisible-island.net/datafiles/current/terminfo.src.gz \
        && gunzip terminfo.src.gz
      tic -xe tmux-256color terminfo.src
      rm terminfo.src
    fi
  '';
}
