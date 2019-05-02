export ZSH=/Users/aldidas/.oh-my-zsh
ZSH_THEME="cloud-aldi"
plugins=(git osx tmux)
source $ZSH/oh-my-zsh.sh

export PATH="$(brew --prefix php@7.1)/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export LANG=en_US.UTF-8

alias tmux="TERM=screen-256color-bce tmux"
alias dbstart="mysql.server start"
alias dbstop="mysql.server stop"
alias bundletool="java -jar /usr/local/bin/bundletool.jar"

alias emulator_nexus="/Users/aldidas/Library/Android/sdk/tools/emulator @Nexus_5X_API_23"
alias emulator_pixel="/Users/aldidas/Library/Android/sdk/tools/emulator @Pixel_API_25"

. ~/bin/z.sh
export PATH="/usr/local/sbin:$PATH"
DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer/"
export DEVELOPER_DIR

export PATH="$PATH:`yarn global bin`"

export ANDROID_HOME="/Users/aldidas/Library/Android/sdk"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$ANDROID_HOME/tools:$PATH"

export TERM=xterm-256color
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NODE_ENV="development"
export LOLCOMMITS_DELAY=2
export REACT_EDITOR=vim
export GOPATH="$HOME/workspace/Go"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/Dart/flutter/bin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
eval "$(rbenv init -)"
