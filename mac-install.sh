RUBY_VERSION="2.7.0"

function spacify {
  tr '\n' ' ' < $1
}

sudo

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install $(spacify brew.list)
brew cask install $(spacify cask.list)

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Plug plugin manager for neovim/vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Link it all together
ln -sfn $PWD/zshrc $HOME/.zshrc
ln -sfn $PWD/tmux.conf $HOME/.tmux.conf
sudo ln -sfn $PWD/hosts /etc/hosts
ln -sfn $PWD/vimrc $HOME/.vimrc
ln -sfn $PWD/alacritty.yml $HOME/.alacritty.yml
ln -sfn $PWD/gitconfig $HOME/.gitconfig
ln -sfn $PWD/gitignore_global $HOME/.gitignore_global
ln -sfn $PWD/karabiner.json $HOME/.config/karabiner/karabiner.json
ln -sfn $PWD/com.googlecode.iterm2.plist $HOME/Library/Preferences/com.googlecode.iterm2.plist
ln -sfn $PWD/teamocil $HOME/.teamocil

source $HOME/.zshrc
ruby-install ruby $RUBY_VERSION
chruby ruby-$RUBY_VERSION

npm install -g $(spacify npm.list)
gem install -g $(spacify gem.list)

# This repo can be cloned/installed anywhere
# but we always make a link here such that
# other scripts know where to find things
ln -sfn $PWD $HOME/.dotfiles

# This directory may not exist yet,
# so we make a call to `mkdir`
# for good measure
mkdir -p $HOME/.config/nvim
ln -sfn $PWD/init.vim $HOME/.config/nvim/init.vim

mkdir $HOME/Screenshots
defaults write com.apple.screencapture location -string $HOME/Screenshots
defaults write com.apple.screencapture show-thumbnail -bool FALSE
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
