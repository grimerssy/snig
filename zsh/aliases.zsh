alias n="nvim"
alias l="lazygit"
alias t="tmux"
alias a="tmux attach"
alias s="tmux-session.sh"
alias c="clear"
alias cn="clear && neofetch"
alias senv="source .env"
alias sepsql="senv && psql \$DATABASE_URL"

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
