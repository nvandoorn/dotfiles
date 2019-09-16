# Install brew and use it as our entry point
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install command line tools
brew install git neovim zsh vim emacs lsd tmux redis postgres \
  fzy fzf the_silver_searcher ccat ffmpeg go rustup openssl irssi scrot \
  screenfetch ranger python3 python2 rsync hub wget
# Make sure we use the GNU variants of most tools
brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep

# Install graphical apps
brew cask install google-chrome karabiner-elements slack spotify sketch gpg-suite \
  bartender spectacle visual-studio-code-insiders iterm2 caskroom/versions/firefoxdeveloperedition chromedriver \
  keybase signal netlify-cli heroku/brew/heroku discord java android-sdk

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

# rbenv
git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
mkdir -p $HOME/.rbenv/plugins
$ git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build

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

# This directory may not exist yet,
# so we make a call to `mkdir`
# for good measure
mkdir -p $HOME/.config/nvim
ln -sfn $PWD/init.vim $HOME/.config/nvim/init.vim

mkdir $HOME/Screenshots
defaults write com.apple.screencapture location -string $HOME/Screenshots
defaults write com.apple.screencapture show-thumbnail -bool FALSE
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
