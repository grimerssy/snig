ALACRITTY=~/.config/alacritty
BIN=~/.local/bin
LAZYGIT=_
NVIM=~/.config/nvim
TMUX=~/.config/tmux
ZSH=~/.config/zsh
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

ln -s ~/.dotfiles/alacritty $ALACRITTY
ln -s ~/.dotfiles/bin $BIN
ln -s ~/.dotfiles/lazygit $LAZYGIT
ln -s ~/.dotfiles/nvim $NVIM
ln -s ~/.dotfiles/tmux $TMUX
ln -s ~/.dotfiles/zsh $ZSH

ln -s ~/.dotfiles/zshrc ~/.zshrc
source ~/.zshrc

mkdir -p $FONTS
for FONT in ~/.dotfiles/fonts/*
do
  cp $FONT $FONTS
done

for SCRIPT in $BIN/*
do 
  if [ -f $SCRIPT ]; then
    chmod +x $SCRIPT
  fi
done
