source /usr/share/zsh/scripts/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
#antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle web-search
antigen bundle archlinux

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme oskarkrawczyk/honukai-iterm-zsh honukai

# Tell antigen that you're done.
antigen apply


# Terminal Color Theme
BASE16_SHELL="$HOME/dotfiles/base16-ocean.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Distinguish myself as a nekkbeard
export VISUAL=vim
export EDITOR=vim
