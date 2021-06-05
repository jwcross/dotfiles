touch ~/.hushlogin
#export PS1='\W $ '
#export PS1='\W λ '
#export PS1='\W λx '
#export PS1='λx \W '
#export PS1='\W ℂ '
#export PS1='\W ∀x ∈ ℂ: '
#export PS1='\W ℍ '
#export PS1='\W ℕ '
#export PS1='\W ℙ '
#export PS1='\W n ∈ ℙ: '
#export PS1='\W ℚ '
#export PS1='\W ℝ '
#export PS1='\W ℤ '
#export PS1='\W χ '
#export PS1='\W σ(n) '
#export PS1='\W ∀ '

export CLICOLOR=1

include() {
    [[ -f "$1" ]] && source "$1"
}

[[ -d ~/bin ]] && PATH=$PATH:~/bin
[[ -d ~/vim ]] && PATH=$PATH:~/vim

include() {
    [ -f "$1" ] && source "$1"
}

source_subdirectory() {
    source ~/dotfiles/$1/bash_profile
}

source_subdirectory setup

source_subdirectory bash
source_subdirectory git
#source_subdirectory python # python configuration greatly slows down new windows. Enable this when needed.
source_subdirectory ruby
source_subdirectory vscode
source_subdirectory xcode

include ~/dotfiles/local/bash_profile.local

include ~/bin/bash_profile.bin
include ~/.bash_profile.work

export PATH="$HOME/.elan/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"

# Disable terminal windows from including username, window size, etc
DISABLE_AUTO_TITLE="true"
