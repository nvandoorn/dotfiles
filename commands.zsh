alias vi=nvim
alias vim=vi
alias v=vi
alias vl="VIM_THEME=PaperColor VIM_AIRLINE_THEME=papercolor VIM_BACKGROUND=light v"
alias g=git
alias cat=ccat
alias bx='bundle exec'
alias bxr='bx rake'
alias s='bx rspec'
alias ls='lsd -1'
alias leaky="pkill -9 -f 'rb-fsevent|rails|puma|node'"
alias awake="sudo pmset -a sleep 0; sudo pmset -a hibernatemode 0; sudo pmset -a disablesleep 1;"
alias sleepy="sudo pmset -a sleep 1; sudo pmset -a hibernatemode 25; sudo pmset -a disablesleep 0;"

function vs() {
  v $(need)
}

function ss() {
  s $(need)
}

function need() {
  ag . -l | fzy
}

function killer() {
  kill -9 $(ps aux | fzy | gawk '{print$2}')
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