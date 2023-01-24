alias clr="clear && neofetch"

alias v="nvim"
alias l="lazygit"
alias t="tmux"
alias a="tmux attach"
alias s="tmux-session.sh"

alias c="cargo"
alias cn="c new"
alias ca="c add"
alias ch="c check"
alias cha="ch --all-targets"
alias ct="ulimit -n 1024 && c test"
alias cr="c run"
alias crr="cr --release"

alias n="pnpm"
alias nrd="n run dev"
alias svelte="n create svelte@latest"

alias senv="source .env"
alias sep="senv && psql \$DATABASE_URL"

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
