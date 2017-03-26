#darwin ls command does not support --color option.
alias ls=' ls'
#alias myls=' ls'
# use gnu ls instead of bsd ls
alias myls=' gls -C -F -h --color=always'

# The OSX way for ls colors.
export CLICOLOR=1
export LSCOLORS="gxfxcxdxbxegedabagacad"

# brew install zsh-completions
export FPATH=/usr/local/share/zsh-completions:/usr/local/share/zsh/functions:$FPATH
