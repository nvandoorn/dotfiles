sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs /
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s "$PWD/zshrc" ~/.zshrc
ln -s "$PWD/init.vim" ~/.config/nvim/init.vim
ln -s "$PWD/avit-lambda.zsh-theme" ~/.oh-my-zsh/themes
ln -s "$PWD/gitconfig" ~/.gitconfig

