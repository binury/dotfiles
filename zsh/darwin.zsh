export HOMEBREW_NO_AUTO_UPDATE=1
#skip periodic dependency upgrade checks
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1

# brew install zsh-completions
export FPATH=/usr/local/share/zsh-completions:/usr/local/share/zsh/functions:$FPATH
