alias vi=nvim
alias vim=vi
alias v=vi
alias vl="VIM_THEME=PaperColor VIM_AIRLINE_THEME=papercolor VIM_BACKGROUND=light v"
alias g=git
alias cat=bat
alias c=cat
alias rm=trash
alias bx='bundle exec'
alias bxr='bx rake'
alias s='bx rspec'
alias ls='lsd -1'
alias r='bin/rails'
alias leaky="pkill -9 -f 'rb-fsevent|rails|puma|node'"
alias awake="sudo pmset -a sleep 0; sudo pmset -a hibernatemode 0; sudo pmset -a disablesleep 1;"
alias sleepy="sudo pmset -a sleep 1; sudo pmset -a hibernatemode 25; sudo pmset -a disablesleep 0;"

function peek() {
  c $(need)
}

function thisruby() {
  chruby $(cat .ruby-version)
}

function vls() {
  vl $(need)
}

function vg() {
  v -c "G"
}

function vs() {
  v $(need)
}

function ss() {
  s $(need)
}

function need() {
  ag . -l | fzy
}

function dig() {
  ag . | fzy -l 20 | gawk '{split($0, a, ":"); print a[1]}'
}

function vd() {
  v $(dig)
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

function fuckredis() {
  redis-cli flushdb
}

function diebitch() {
  kill $(lsof -i :$1 -t)
}

function smol() {
  ffmpeg -i $1 -vcodec libx264 -pix_fmt yuv420p -profile:v baseline -level 3 $2
}

function spacify {
  tr '\n' ' ' < $1
}
