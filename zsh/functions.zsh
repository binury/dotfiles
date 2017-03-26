#strg+x,s adds sudo to the line
# Zsh Buch p.159 - http://zshbuch.org/
run-with-sudo() { LBUFFER="sudo $LBUFFER" }
zle -N run-with-sudo
bindkey '^Xs' run-with-sudo

brewbump() {
  echo -e "\nUpdating Homebrew...\n"
  brew update
  echo -e "\nUpgrading Homebrew...\n"
  brew upgrade 
  echo -e "\nCleaning your mess...\n"
  brew cleanup
  brew prune
  echo -e "\nDone.\n"
}
