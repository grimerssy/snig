cat "$DOTFILES/setup/mac/asdf_list" | while read line; do
  asdf plugin add $line
  asdf install $line latest
  asdf global $line latest
done
