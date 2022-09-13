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

zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"

eval "$(zoxide init zsh)"
source go-version-manager.sh init
