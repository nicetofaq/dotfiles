# SYMLINKS
ln -sn "$HOME/Library/Mobile Documents/com~apple~CloudDocs" "$HOME/icloud"

# EXPORTS
export DOTFILES="$HOME/dotfiles"
export ICLOUD="$HOME/icloud"
export REPOS="$HOME/repos"
export MISTVALLEY="$REPOS/github.com/mistvalley"
export YUMA="$MISTVALLEY/scale_yuma"
export CDPATH=.:$HOME/icloud:$CDPATH
export DOCKER_HOST="$HOME/.colima/docker.sock"
export OVN="$REPOS/github.com/ovn"

# Check if .fzf.bash exists before sourcing it
if [ -f ~/.fzf.bash ]; then
	source ~/.fzf.bash
fi

# ALIASES
alias v='nvim'
alias vi='nvim'

# Improved ls alias with options
alias cat='bat'
alias man='tldr'

# Directory navigation aliases
alias sc='cd "$ICLOUD/second-brain"'
alias yuma='cd "$YUMA"'
alias repos='cd "$REPOS"'
alias mist='cd "$MISTVALLEY"'
alias dot='cd "$DOTFILES"'
alias icloud='cd "$ICLOUD"'
alias lab='cd $REPOS/github.com/nicetofaq/k8s'
alias ovn='cd $OVN'

# k8s
alias k='kubectl'
alias kgp='kubectl get pods'
alias h='helm'

# Aliases for specific commands or paths
alias yumar='/Users/Shared/GameMakerStudio2/Cache/runtimes/runtime-2024.4.0.168/bin/igor/osx/arm64/Igor -j=8 -options="$MISTVALLEY/build.bff" -- Mac Run'
alias yumagm='open "$HOME/Library/Application Support/Steam/steamapps/common/GameMaker Studio 2/GameMaker.app" --args "$YUMA/yuma/YumaE.yyp"'

# Git related aliases
alias cbr='git branch --sort=-committerdate | grep -v "^\*" | fzf --header "Checkout Recent Branch" --preview "git log --decorate --oneline --graph --abbrev-commit -n 10 {1}" --preview-window=right:70% --pointer="" | xargs -I{} git checkout {}'
alias cbrf='git fetch && git branch --sort=-committerdate | grep -v "^\*" | fzf --header "Checkout Recent Branch" --preview "git log --decorate --oneline --graph --abbrev-commit -n 10 {1}" --preview-window=right:70% --pointer="" | xargs -I{} git checkout {}'

# Initialize thefuck and fzf
eval "$(thefuck --alias)"
eval "$(fzf --bash)"

# Set fd as the default command for fzf
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd to generate the list for file path completion
_fzf_compgen_path() {
	fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
	fd --type=d --hidden --exclude .git . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
	local command="$1"
	shift

	case "$command" in
	cd) fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
	export | unset) fzf --preview "eval 'echo $'{}" "$@" ;;
	ssh) fzf --preview 'dig {}' "$@" ;;
	*) fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
	esac
}

# Set preview options for fzf
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
