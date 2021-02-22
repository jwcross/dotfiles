#setup/bash_profile

# Global vars
#############

OSS=~/Code/OSS

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

# Homebrew
##########

installOrUpdateHomebrew() {
    if [[ `which brew` ]]; then
        brew update # TODO: Suppress "Already up to date"
    else
        echo "installing homebrew"
        /bin/bash -c "`curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh`"
    fi
}

installOrUpgrade() {
    pkg="$1"
    if brew ls --versions "$pkg" >/dev/null; then
        HOMEBREW_NO_AUTO_UPDATE=1 brew upgrade "$pkg"
    else
        HOMEBREW_NO_AUTO_UPDATE=1 brew install "$pkg"
    fi
}

PACKAGES=(
    blackhole-2ch
    carthage
    coreutils
    ffmpeg
    imagemagick
    swiftlint
    tmux
)

installOrUpdateHomebrew

for pkg in ${PACKAGES[@]}; do
    installOrUpgrade $pkg
done
