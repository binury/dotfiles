#strg+x,s adds sudo to the line
# Zsh Buch p.159 - http://zshbuch.org/
run-with-sudo() { LBUFFER="sudo $LBUFFER" }
zle -N run-with-sudo
bindkey '^Xs' run-with-sudo
