export DOTFILES_PATH=$HOME/.dotfiles
export KEYTIMEOUT=1

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME=sunrise
source $ZSH/oh-my-zsh.sh

# git alias/functions
source $DOTFILES_PATH/git.zsh
source $DOTFILES_PATH/commands.zsh
source $DOTFILES_PATH/personal.zsh

# package/version managers
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export RUBIES="$HOME/.rubies"
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
source $DOTFILES_PATH/nvm.zsh
export PATH="$HOME/.gobin:$PATH"

# Custom scripts and binaries
export PATH="$DOTFILES_PATH/bin:$PATH"

# Editor/term settings
export VISUAL=nvim
export EDITOR=$VISUAL
export TERM=screen-256color
export VIM_BACKGROUND=dark
export VIM_THEME=onedark
export VIM_AIRLINE_THEME=onedark
