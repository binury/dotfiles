# XDG Base Directory Specification
# http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export ZSH_CONFIG="$XDG_CONFIG_HOME/zsh"
export ZSH_CACHE="$XDG_CACHE_HOME/zsh"
mkdir -p $ZSH_CACHE
export SDKMAN_DIR="/Users/teddy/.sdkman"
export PYENV_ROOT="$HOME/.pyenv"
export CELLAR="/usr/local/Cellar/node/7.8.0/bin"
export PATH="$CELLAR:$HOME/.pyenv:$HOME/.rvm/bin:$HOME/.jenv/bin:/usr/local/bin:$PATH"

