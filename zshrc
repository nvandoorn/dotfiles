# oh-my-zsh
export ZSH=~/.oh-my-zsh
DEFAULT_USER="nick"
plugins=(git async node ruby rails)
source $ZSH/oh-my-zsh.sh

# package/version managers
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
source /usr/local/share/chruby/chruby.sh
source $HOME/.bin/check-version.zsh
export PATH="$HOME/.cargo/bin:$PATH"

# editor/term settings
export VISUAL=nvim
export EDITOR="$VISUAL"
export TERM="screen-256color"

# theme env vars
export ZSH_THEME='sunrise'
export VIM_THEME='OceanicNext'
export VIM_AIRLINE_THEME='oceanicnext'

# tiny-care-terminal
export TTC_REPOS=''
export TTC_REPOS_DEPTH=2
export TTC_GITBOT='gitlog'
export TTC_WEATHER='Victoria, BC'
export TTC_SAY_BOX='parrot'
export TTC_APIKEYS=false

# command alias
alias vi=nvim
alias cat=ccat
alias ls='lsd -l'
alias gs='git status'
alias gsh='git status ./'
alias gdc='git diff --cached'
alias gdch='git diff --cached ./'
alias gdh='git diff ./'
alias gac='git add-commit'
alias ga='git add'
alias gc='git commit'
alias gpo='git push origin'
alias gp='git push'
alias gr='git reset'
alias grh='git reset --hard'
alias gb='git branch'
alias gch='git checkout'
alias grf='git checkout --'

# folder alias
alias cddotfiles='cd ~/Documents/dotfiles'

# avoid nesting tmux sessions
if [ "$TMUX" = "" ]; then
  tmux;
fi

# backup helper function
backup() {
  rsync -rua --info=progress2 --exclude-from="$PWD/Documents/dotfiles/rsync-ignore.txt" ~/Documents /Volumes/nick/backups
}

function chpwd() {
  checkVersions
}
