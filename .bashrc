# SYMLINKS

ln -sn "$HOME/Library/Mobile Documents/com~apple~CloudDocs" $HOME/icloud

# EXPORTS

export DOTFILES=$HOME/dotfiles
export ICLOUD=$HOME/icloud
export REPOS=$HOME/repos
export MISTVALLEY=$REPOS/github.com/mistvalley
export YUMA=$MISTVALLEY/scale_yuma
export CDPATH=.:$HOME/icloud:$CDPATH

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# ALIASES

alias v='nvim'
alias vi='nvim'
alias ll='ls -alF'
alias sc='cd "$ICLOUD/second-brain"'
alias yuma='cd $YUMA'
alias repos='cd $REPOS'
alias mist='cd $MISTVALLEY'
alias dot='cd $DOTFILES'
alias icloud='cd $ICLOUD'
alias yumab='"/Users/Shared/GameMakerStudio2/Cache/runtimes/runtime-2024.2.0.163/bin/igor/osx/arm64/Igor"  -j=8  -options="$MISTVALLEY/build.bff" -v -- Mac Run'
