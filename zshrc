# Environment
export DOTFILES_PATH=$HOME/.dotfiles
export KEYTIMEOUT=1
export VISUAL=nvim
export EDITOR=$VISUAL
export TERM=screen-256color
export VIM_BACKGROUND=dark
export VIM_THEME=gruvbox
export VIM_AIRLINE_THEME=gruvbox

# Custom shell functions
source $DOTFILES_PATH/pairing.zsh
source $DOTFILES_PATH/multi-branch.zsh
source $DOTFILES_PATH/git.zsh
source $DOTFILES_PATH/commands.zsh
source $DOTFILES_PATH/personal.zsh
source $DOTFILES_PATH/work.zsh

# Version managers
eval "`fnm env --use-on-cd --multi`"
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
source $HOME/.kiex/scripts/kiex

# Use the latest ruby for shells by default
chruby $(ls ~/.rubies | tail -n 1)

# Path
export PATH="$DOTFILES_PATH/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# Auto complete
zmodload zsh/complist
autoload -Uz compinit
compinit

# Prompt style
autoload -U colors zsh/terminfo
colors
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' check-for-staged-changes true
zstyle ':vcs_info:*' stagedstr '%F{2}*'
zstyle ':vcs_info:*' unstagedstr '%F{1}*'
zstyle ':vcs_info:git*' formats " %F{14}%b%u%c%m%{$reset_color%}"
precmd() { vcs_info }

setprompt() {
  setopt prompt_subst

  PS1=${(j::Q)${(Z:Cn:):-$'
    %F{4}%~%f
    ${vcs_info_msg_0_}
    %F{5}%(1j. %j.)%f
    " "
    %(?.%F{10}.%F{1})$%f
    " "
  '}}
}
setprompt

bindkey -v
