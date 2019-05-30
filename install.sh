function downloadUnzip() {
  wget $1 -P $HOME/.bin
  unzip $HOME/.bin/$2
  rm $HOME/.bin/*.zip
}

INSTALL_DEPS="git nvim zsh chruby ruby-install redis postgres fzf the_silver_searcher"

# use brew on mac
if [[ "$OSTYPE" == "darwin"* ]]; then
  # brew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  # Install what we can with brew
  brew install $INSTALL_DEPS
  downloadUnzip https://chromedriver.storage.googleapis.com/74.0.3729.6/chromedriver_mac64.zip chromedriver_mac64.zip
# assume apt package manager for linux based operating systems
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
  sudo apt-get install $INSTALL_DEPS
  downloadUnzip https://chromedriver.storage.googleapis.com/74.0.3729.6/chromedriver_linux64.zip chromedriver_linux64.zip
fi

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
# use the latest
ruby-install --latest
nvm install --lts
mkdir $HOME/.bin
wget https://raw.githubusercontent.com/samphippen/rubyfmt/master/src/rubyfmt.rb -P $HOME/.bin
wget https://raw.githubusercontent.com/nvandoorn/versions-are-important/master/check-version.zsh -P $HOME/.bin
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# vim plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# link it all together
ln -s "$PWD/zshrc" $HOME/.zshrc
ln -s "$PWD/init.vim" $HOME/.config/nvim/init.vim
ln -s "$PWD/gitconfig" $HOME/.gitconfig
ln -s "$PWD/gitignore_global" $HOME/.gitignore_global
