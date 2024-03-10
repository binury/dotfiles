# TODO: No longer working, probably due to vi
# run-with-sudo() {
#   LBUFFER="sudo $LBUFFER"
# }
# zle -N run-with-sudo
# bindkey '^Xs' run-with-sudo

brewbump() {
  echo
  echo "Updating Homebrew…"
  brew update
  echo
  echo "Upgrading Homebrew…"
  brew upgrade
  echo
  echo "Cleaning your mess…"
  brew cleanup
  brew prune
  echo
  echo "Done 🎉"
}

dev() {
  npm run dev --silent || npm run startdev --silent
}

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$_"
}

# Bindings for historical substring search (via plugin)
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
