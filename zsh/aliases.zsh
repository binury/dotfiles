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

##### standard aliases (start with a space to be ignored in history)
## default ls is untouched, except coloring
# alias ls=' ls --color=auto'
# alias myls=' ls -C -F -h --color=always'
# alias l=" myls -l"
# alias ll=' myls -l'
# alias la=' myls -lA'
# alias v=" clear; ll -gh"    # standard directory view
# alias vs=" v **/*(.)"         # show all files in all subdirs plain in a list

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
alias ka="killall"

alias cd=' cd'
alias ..=' cd ..; ls'
alias ...=' cd ..; cd ..; ls'
alias ....=' cd ..; cd ..; cd ..; ls'
alias cd..='..'
alias cd...='...'
alias cd....='....'

alias cat='bat'

alias nr='npm run'
