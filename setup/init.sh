#!/bin/sh

ALACRITTY=$HOME/.config/alacritty
BIN=$HOME/.local/bin
FIREFOX=$HOME/.config/firefox
KARABINER=$HOME/.config/karabiner
LAZYGIT=_
NEOFETCH=$HOME/.config/neofetch
NVIM=$HOME/.config/nvim
SKHD=$HOME/.config/skhd
TMUX=$HOME/.config/tmux
YABAI=$HOME/.config/yabai
ZSH=$HOME/.config/zsh
FONTS=_

case "$(uname -s)" in
Darwin)
  LAZYGIT=~/Library/Application\ Support/jesseduffield/lazygit
  FONTS=~/Library/Fonts
  mkdir -p ~/Library/Application\ Support/jesseduffield
  ln -s ~/.dotfiles/Brewfile ~/.Brewfile
	;;
Linux)
  LAZYGIT=~/.config/lazygit
  FONTS=~/.fonts
	;;
*)
  exit 0
	;;
esac

mkdir -p ~/.config
mkdir -p ~/.local

ln -s ~/.dotfiles/alacritty "$ALACRITTY"
ln -s ~/.dotfiles/bacon "$BACON"
ln -s ~/.dotfiles/bin "$BIN"
ln -s ~/.dotfiles/firefox "$FIREFOX"/chrome
ln -s ~/.dotfiles/karabiner "$KARABINER"
ln -s ~/.dotfiles/lazygit "$LAZYGIT"
ln -s ~/.dotfiles/neofetch "$NEOFETCH"
ln -s ~/.dotfiles/nvim "$NVIM"
ln -s ~/.dotfiles/skhd "$SKHD"
ln -s ~/.dotfiles/tmux "$TMUX"
ln -s ~/.dotfiles/yabai "$YABAI"
ln -s ~/.dotfiles/zsh "$ZSH"

ln -s ~/.dotfiles/zshrc ~/.zshrc
source ~/.zshrc

mkdir -p $FONTS
for FONT in ~/.dotfiles/fonts/*; do
  if [ -f "$FONT" ]; then
    FONT=$(echo "$FONT" | sed -e 's/ /\\ /g')
    eval "cp $FONT $FONTS"
  fi
done

for SCRIPT in "$BIN"/*; do
  if [ -f "$SCRIPT" ]; then
    SCRIPT=$(echo "$SCRIPT" | sed -e 's/ /\\ /g')
    eval "chmod +x $SCRIPT"
  fi
done
