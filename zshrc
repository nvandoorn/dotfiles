# oh-my-zsh
export ZSH=~/.oh-my-zsh
DEFAULT_USER="nick"
plugins=(git async node ruby rails)
source $ZSH/oh-my-zsh.sh

# package/version managers
export DEFAULT_RUBY_VERSION="2.6.3"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
source /usr/local/share/chruby/chruby.sh
source $HOME/.bin/check-version.zsh
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
chruby $DEFAULT_RUBY_VERSION


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
alias bue='bundle exec'
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
alias cddotfiles='cd $HOME/Documents/dotfiles'
alias cdpeachy='cd $HOME/Documents/peachy'
alias cdball='cd $HOME/Documents/SmartBallot'
alias cdballj='cd $HOME/Documents/smart-ballot-journal'

# avoid nesting tmux sessions
if [ "$TMUX" = "" ]; then
  tmux;
fi

# backup helper function
backup() {
  rsync -rua --info=progress2 --exclude-from="$HOME/Documents/dotfiles/rsync-ignore.txt" $HOME/Documents /Volumes/nick/backups
}

function chpwd() {
  # checkVersions
}

function dbup() {
  pg_ctl -D /usr/local/var/postgres start
  redis-server /usr/local/etc/redis.conf --daemonize yes
}

# TODO stop redis
function dbdown() {
  pg_ctl -D /usr/local/var/postgres stop
}
