export XDG_CONFIG_HOME="$HOME"/.config
export BASH_SILENCE_DEPRECATION_WARNING=1

source .bashrc
eval "$(/opt/homebrew/bin/brew shellenv)"

# The next line updates PATH for CLI.
if [ -f '/Users/nicetofaq/yandex-cloud/path.bash.inc' ]; then source '/Users/nicetofaq/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/Users/nicetofaq/yandex-cloud/completion.bash.inc' ]; then source '/Users/nicetofaq/yandex-cloud/completion.bash.inc'; fi


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="$HOME/anaconda3/bin:$PATH"

# The next line updates PATH for Nebius CLI.
if [ -f '/Users/nicetofaq/.nebius/path.bash.inc' ]; then source '/Users/nicetofaq/.nebius/path.bash.inc'; fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nicetofaq/google-cloud-sdk/path.bash.inc' ]; then . '/Users/nicetofaq/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nicetofaq/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/nicetofaq/google-cloud-sdk/completion.bash.inc'; fi
. "$HOME/.cargo/env"
