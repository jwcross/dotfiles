# Suppress annoying messages at start of sessions
#################################################
# "Last login"
touch ~/.hushlogin
# TODO: "Restored session"
# Disable terminal windows from including username, window size, etc
DISABLE_AUTO_TITLE="true"

# Customize PROMPT
##################
# 'CurrentDir λ '
export PROMPT='%1d λ '
# Full set of prompt expansions:
#   https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html#Prompt-Expansion
# Other spark-joy characters:
#   λ ℂ ∀x ∈ ℂ: ℍ ℕ ℙ n ∈ ℙ: ℚ ℝ ℤ χ σ(n) ∀

# Colors, styling
#################
export CLICOLOR=1

# More
######

[[ -d ~/bin ]] && PATH=$PATH:~/bin
[[ -d ~/vim ]] && PATH=$PATH:~/vim
setopt auto_cd

source ~/dotfiles/bash/bash_profile
source ~/dotfiles/git/bash_profile
source ~/dotfiles/ruby/bash_profile
source ~/dotfiles/setup/bash_profile
source ~/dotfiles/vscode/bash_profile
source ~/dotfiles/xcode/bash_profile

source ~/dotfiles/local/bash_profile.local
source ~/bin/bash_profile.bin
source ~/.bash_profile.work
source ~/.functions

export PATH="$HOME/.elan/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"

# Preserve emacs keybindings in tmux (e.g. ^A start of line)
bindkey -e
