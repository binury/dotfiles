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

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

# Bindings for historical substring search (via plugin)
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
