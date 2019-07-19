export DOTFILES_PATH="$HOME/Documents/dotfiles"
export KEYTIMEOUT=1

export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# git alias/functions
source $DOTFILES_PATH/git.zsh

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
export VISUAL=vim
export EDITOR="$VISUAL"
export TERM="screen-256color"

# theme env vars
export VIM_THEME='gruvbox'
export VIM_AIRLINE_THEME='gruvbox'

# command alias
alias vi=vim
alias g=git
alias vil='VIM_THEME=PaperColor vi'
alias cat=ccat
alias bx='bundle exec'
alias ls='lsd'
alias leaky="pkill -9 -f 'rb-fsevent|rails|puma|node'"

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
function backup() {
  rsync -rua --info=progress2 --exclude-from="$DOTFILES_PATH/rsync-ignore.txt" $HOME/Documents /Volumes/nick/backups
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

# TODO use a "trap" here so ctl + c
# kills rails and webpack-dev-server with one go
function railsdev() {
  bin/rails server &> /dev/null &
  bin/webpack-dev-server &> /dev/null &
}

function diebitch() {
  kill $(lsof -i :$1 -t)
}

function togif() {
  ffmpeg -i $1 -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=$2 --delay=3 > out.gif
}

autoload -U promptinit; promptinit
prompt pure
