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

export PATH="$HOME/.local/bin:$GNU_ROOT:/usr/local/sbin:/usr/local/bin:$VSC_ROOT:$GEM_HOME/bin:$OPAMPATH:$OPAMPATH:$PEARPATH:$YARNPATH:$COMPOSER_ROOT:$NVM_PATH:$CARGOPATH:$PATH"

# https://jonasjacek.github.io/colors
FC='38;5' # Full Color ANSI 256 Prefix
declare -A colors
colors=(
  [ejs]=149
  [js]=184
  [jsx]=116
  [json]=251
  [ts]=32
  [css]=33
  [less]=25
  [sass]=133
  [html]=166
)
for ext clr in ${(kv)colors}; do LS_COLORS+="*.$ext=$FC;${colors[$ext]}:"; done
export LS_COLORS
