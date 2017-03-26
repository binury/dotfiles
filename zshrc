bindkey -v
export KEYTIMEOUT=1
source $HOME/dotfiles/antigen.zsh

antigen use oh-my-zsh
antigen bundle git
#antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle web-search
antigen bundle vi-mode
#antigen bundle archlinux

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search

# Load the theme.
antigen theme oskarkrawczyk/honukai-iterm-zsh honukai

# Tell antigen that you're done.
antigen apply

# Version Managers
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Terminal Color Theme
BASE16_SHELL="$HOME/dotfiles/base16-ocean.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export VISUAL=vim
export EDITOR=vim

# For OSX
export TREASURE=/Volumes/treasure
alias vim=nvim
alias tree='tree -C'
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/teddy/.sdkman"
[[ -s "/Users/teddy/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/teddy/.sdkman/bin/sdkman-init.sh"
