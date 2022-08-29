# !/bin/sh

for conf in $HOME/.config/zsh/*.zsh; do
  source ${conf}
done

unset conf
