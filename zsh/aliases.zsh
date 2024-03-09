export EDITOR="nvim"
bindkey -v

alias vi="vim"
alias vim="nvim"
alias aedit=" $EDITOR $ZSH_CONFIG/aliases.zsh; source $ZSH_CONFIG/aliases.zsh"
alias fedit=" $EDITOR $ZSH_CONFIG/functions.zsh; source $ZSH_CONFIG/functions.zsh"
alias pedit=" $EDITOR $ZSH_CONFIG/private.zsh; source $ZSH_CONFIG/private.zsh"
alias viedit=" $EDITOR $HOME/.vim/vimrc"

alias tree='tree -C'
alias grep='grep --color=auto'

alias ls='exa -G'
alias l='exa -lbF --git' # list, size, type, git
alias ll='exa -lbGF --git' # long list
alias llm='ll --sort=modified' # modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list
# specialty views
alias lS='exa -1'                                                              # one column, just names
alias lt='exa --tree --level=2'                                         # tree

alias p=' ps aux | grep'
alias g='git'
alias b='brew'
alias d=' dirs -v'

alias cat='bat'
alias pb='pbcopy'

alias nr='npm run'

