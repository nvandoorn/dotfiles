export DOTFILES_PATH=$HOME/.dotfiles
export KEYTIMEOUT=1

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME=sunrise
source $ZSH/oh-my-zsh.sh

# git alias/functions
source $DOTFILES_PATH/git.zsh
source $DOTFILES_PATH/commands.zsh
source $DOTFILES_PATH/personal.zsh
source $DOTFILES_PATH/work.zsh

# version managers
eval "`fnm env --multi`"
source /usr/local/share/chruby/chruby.sh
export PATH="$HOME/.gobin:$PATH"
source $HOME/.kiex/scripts/kiex

# Use the latest ruby for shells by default
chruby $(ls ~/.rubies | tail -n 1)

# Custom scripts and binaries
export PATH="$DOTFILES_PATH/bin:$PATH"

# Editor/term settings
export VISUAL=nvim
export EDITOR=$VISUAL
export TERM=screen-256color
export VIM_BACKGROUND=dark
export VIM_THEME=gruvbox
export VIM_AIRLINE_THEME=gruvbox
