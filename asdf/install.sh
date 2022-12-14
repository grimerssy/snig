cat "$DOTFILES/asdf/plugins" | while read plugin; do
  asdf plugin add $plugin
  asdf install $plugin latest
  asdf global $plugin latest
done
