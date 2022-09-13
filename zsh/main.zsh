ZDOTDIR="$HOME/.config/zsh"
HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=750000
setopt appendhistory

setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef
zle_highlight=("paste:none")

unsetopt BEEP

autoload -Uz compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
_comp_options+=(globdots)

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

autoload -Uz colors && colors

add_plugin "zsh-users/zsh-autosuggestions"
add_plugin "zsh-users/zsh-syntax-highlighting"
add_plugin "hlissner/zsh-autopair"

eval "$(zoxide init zsh)"
source go-version-manager.sh init
