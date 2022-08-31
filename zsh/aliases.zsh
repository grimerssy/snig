alias n="nvim"
alias l="lazygit"
alias t="tmux"
alias a="tmux attach"
alias s="tmux-session"
alias c="clear"

if [[ $TERM == "xterm-kitty" ]]; then
  alias ssh="kitty +kitten ssh"
fi

case "$(uname -s)" in

Darwin)
	alias ls="ls -G"
	;;

Linux)
	alias ls="ls --color=auto"
	;;

CYGWIN* | MINGW32* | MSYS* | MINGW*)
	;;
*)
	;;
esac
