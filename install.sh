# This script assumes zsh, nvim, and git are already installed
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.oh-my-zsh/themes/agnoster.zsh-theme --create-dirs \
    https://raw.githubusercontent.com/agnoster/agnoster-zsh-theme/master/agnoster.zsh-theme
ln -s "$PWD/zshrc" ~/.zshrc
ln -s "$PWD/init.vim" ~/.config/nvim/init.vim
ln -s "$PWD/gitconfig" ~/.gitconfig

