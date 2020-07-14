export DOTFILES_PATH=$HOME/.dotfiles
export KEYTIMEOUT=1

export ZSH_THEME=sunrise

# git alias/functions
source $DOTFILES_PATH/git.zsh
source $DOTFILES_PATH/commands.zsh
source $DOTFILES_PATH/personal.zsh
source $DOTFILES_PATH/work.zsh

# version managers
eval "`fnm env --use-on-cd --multi`"
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
export PATH="$HOME/go/bin:$PATH"
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

# Completion Stuff
##################
zmodload zsh/complist 
autoload -Uz compinit
compinit

# Prompt
#------------------------------
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
