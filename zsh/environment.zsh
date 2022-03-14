# XDG Base Directory Specification
# http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export ZSH_CONFIG="$XDG_CONFIG_HOME/zsh"
export ZSH_CACHE="$XDG_CACHE_HOME/zsh"
mkdir -p $ZSH_CACHE

GNU_ROOT="$(brew --prefix)/opt/gnu-sed/libexec/gnubin" # sed on MacOS is fickle
export CARGOPATH="$HOME/.cargo/bin"
export SDKMAN_DIR="$HOME/.sdkman"
export PYENV_ROOT="$HOME/.pyenv"
export RBENV_ROOT="$HOME/.rbenv"
export GOROOT="/usr/local/opt/go/libexec"
export PEARPATH="$HOME/pear/bin";
export OPAMPATH="$HOME/.opam/system/bin"
export PEARPATH="$HOME/pear/bin"
export YARNPATH=`yarn global bin`;
export COMPOSER_ROOT="$HOME/.config/composer/vendor/bin"
export NVM_DIR="$HOME/.nvm"
export NVM_PATH="/usr/local/opt/nvm/nvm.sh"
export VSC_ROOT="/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin"
export GEM_HOME=$HOME/.gem
CURL_PATH="/usr/local/opt/curl/bin"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jre/Contents/Home

export PATH="$HOME/.local/bin:$GNU_ROOT:$CURL_APTH:/usr/local/sbin:/usr/local/bin:$VSC_ROOT:$GEM_HOME/bin:$OPAMPATH:$OPAMPATH:$PEARPATH:$YARNPATH:$COMPOSER_ROOT:$NVM_PATH:$CARGOPATH:$PYENV_ROOT/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH"
