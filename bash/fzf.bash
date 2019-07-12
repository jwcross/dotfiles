if [[ ! $(which fzf) ]]; then
    echo "brew install fzf ..."
    brew install fzf
fi

# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.bash"

# Customizations
# --------------
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
