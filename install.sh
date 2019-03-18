# Install what we can with brew
brew install git nvim zsh
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# vim plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# link it all together
ln -s "$PWD/zshrc" ~/.zshrc
ln -s "$PWD/init.vim" ~/.config/nvim/init.vim
ln -s "$PWD/gitconfig" ~/.gitconfig
ln -s "$PWD/tmux.conf" ~/.tmux.conf
