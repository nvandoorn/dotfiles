export DOTFILES_PATH=$HOME/Documents/dotfiles
export KEYTIMEOUT=1

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME=sunrise
source $ZSH/oh-my-zsh.sh

# git alias/functions
source $DOTFILES_PATH/git.zsh

# package/version managers
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export RUBIES="$HOME/.rubies"
source /usr/local/share/chruby/chruby.sh

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.gobin:$PATH"


# editor/term settings
export VISUAL=nvim
export EDITOR=$VISUAL
export TERM=screen-256color
export VIM_BACKGROUND=dark
export VIM_THEME=OceanicNext
export VIM_AIRLINE_THEME=oceanicnext

# command alias
alias vi=nvim
alias v=vi
alias vl="VIM_THEME=PaperColor VIM_AIRLINE_THEME=papercolor VIM_BACKGROUND=light v"
alias g=git
alias cat=ccat
alias bx='bundle exec'
alias bxr='bx rake'
alias s='bx rspec'
alias ls=lsd
alias leaky="pkill -9 -f 'rb-fsevent|rails|puma|node'"
alias awake="sudo pmset -a sleep 0; sudo pmset -a hibernatemode 0; sudo pmset -a disablesleep 1;"
alias sleepy="sudo pmset -a sleep 1; sudo pmset -a hibernatemode 25; sudo pmset -a disablesleep 0;"

# folder alias
alias cddotfiles='cd $HOME/Documents/dotfiles'
alias cdball='cd $HOME/Documents/smartballot'
alias cdone='cd $HOME/Documents/one_feather'
alias cdballj='cd $HOME/Documents/smart-ballot-journal'

# avoid nesting tmux sessions
if [ "$TMUX" = "" ]; then
  tmux;
fi

# backup helper function
function backup() {
  rsync -rua --info=progress2 --exclude-from="$DOTFILES_PATH/rsync-ignore.txt" $HOME/Documents /Volumes/nick/backups
  rsync -rua --info=progress2 --exclude-from="$DOTFILES_PATH/rsync-ignore.txt" $HOME/Wii /Volumes/nick/backups
  rsync -rua --info=progress2 --exclude-from="$DOTFILES_PATH/rsync-ignore.txt" $HOME/Work /Volumes/nick/backups
  rsync -rua --info=progress2 --exclude-from="$DOTFILES_PATH/rsync-ignore.txt" $HOME/Wallpapers /Volumes/nick/backups
  rsync -rua --info=progress2 --exclude-from="$DOTFILES_PATH/rsync-ignore.txt" $HOME/Pictures /Volumes/nick/backups
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
  bin/webpack-dev-server &
  bx sidekiq &
  bin/rails server
}

function diebitch() {
  kill $(lsof -i :$1 -t)
}

function togif() {
  ffmpeg -i $1 -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=$2 --delay=3 > out.gif
}

function smol() {
  ffmpeg -an -i $1 -vcodec libx264 -pix_fmt yuv420p -profile:v baseline -level 3 $2
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
