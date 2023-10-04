#setup/bash_profile

# Global vars
#############

OSS=~/Code/OSS
DOTFILES=~/dotfiles

# Helper functions
##################

todo() {
    echo "TODO: $1"
}

clone() {
    org=$1
    repo=$2
    dir=$OSS/$repo
    [[ -d $dir ]] || git clone https://github.com/$org/$repo.git $dir
}

# Color scheme
##############

clone dracula terminal-app
theme=`defaults read com.apple.Terminal "Default Window Settings"` 
if [[ ! $theme == "Dracula" ]]; then
    echo "Install Dracula terminal theme? yN"
    read
    if [[ $REPLY == "y" ]]; then
        echo "Set it as default in Terminal.app preferences"
        sleep 1
        open $OSS/terminal-app/Dracula.terminal
    fi
fi

# Symlink dotfiles
##################

symlink() {
    link=~/.$1
    actual=~/dotfiles/$1
    [[ -L $link ]] || ln -s $actual $link
}

symlink aliases
symlink gitconfig
symlink tmux.conf
symlink vimrc
symlink vim/autoload
ln -s $DOTFILES/git/gitignore_global ~/.gitignore

# Homebrew
##########

installHomebrew() {
    if ! [[ `which brew` ]]; then
        echo "Installing homebrew..."
        /bin/bash -c "`curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh`"
    fi
}

installBrews() {
    echo "Updating brews..."

    for pkg in `cat $DOTFILES/BREWS`; do
        [[ `brew ls --versions $pkg` ]] || HOMEBREW_NO_AUTO_UPDATE=1 brew install "$pkg"
    done
}

installCasks() {
    echo "Updating casks..."

    for pkg in `cat $DOTFILES/CASKS`; do
        [[ `brew ls --cask --versions $pkg` ]] || HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask "$pkg"
    done
}

installHomebrew
installBrews
installCasks
