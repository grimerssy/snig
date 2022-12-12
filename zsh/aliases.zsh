alias g="source go-version-manager.sh"
alias n="nvim"
alias l="lazygit"
alias t="tmux"
alias a="tmux attach"
alias s="tmux-session.sh"
alias c="clear"

if [[ $TERM == "xterm-kitty" ]]; then
  alias ssh="kitty +kitten ssh"
fi

case "$(uname -s)" in
Darwin)
	alias ls="ls -G"
  alias neofetch="neofetch --ascii ~/.config/neofetch/mac"
	;;
Linux)
	alias ls="ls --color=auto"
  alias neofetch="neofetch --ascii ~/.config/neofetch/linux"
	;;
CYGWIN* | MINGW32* | MSYS* | MINGW*)
	;;
*)
	;;
esac
