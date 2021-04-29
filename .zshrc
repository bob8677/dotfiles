source /usr/share/instantshell/zshrc

alias 'rm=rm --interactive'
alias 'q=exit'
alias 'ls=ls --color'
alias 'pass-sync=pass git pull && pass git push'
alias 'glava=glava -a fifo'

bindkey '^H' backward-kill-word

zstyle ':fzf-tab:*' fzf-bindings 'backward-eof:abort'
zstyle ':fzf-tab:*' query-string

zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

zinit ice wait lucid
zinit light 'olets/zsh-abbr'
