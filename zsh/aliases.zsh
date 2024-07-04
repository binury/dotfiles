export EDITOR="nvim"
alias vi="vim"
alias vim="nvim"
# TODO
# alias npm="pnpm"
alias aedit=" $EDITOR $ZSH_CONFIG/aliases.zsh; source $ZSH_CONFIG/aliases.zsh"
alias fedit=" $EDITOR $ZSH_CONFIG/functions.zsh; source $ZSH_CONFIG/functions.zsh"
alias pedit=" $EDITOR $ZSH_CONFIG/private.zsh; source $ZSH_CONFIG/private.zsh"
alias viedit=" $EDITOR $HOME/.vim/vimrc"

alias tree='tree -C'
alias grep='grep --color=auto'

alias ls='eza -X --icons --group-directories-first'
alias l='eza -lF --git --no-permissions --icons' # list, size, type, git
alias lm='l --sort=modified' # modified date sort
alias la='eza -lhHigUmuSa --time-style=long-iso --git' # all list
alias lx='la -@' # all + extended list
alias lt='eza --tree --level=2 --icons'                                         # tree

alias p=' ps aux | grep'
alias g='git'
alias b='brew'
alias d=' dirs -v'

alias cat='bat'
alias pb='pbcopy'

alias nr='npm run'
