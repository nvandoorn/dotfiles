# brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Install what we can with brew
brew install git nvim zsh chruby ruby-install
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
