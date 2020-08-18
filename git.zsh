alias gs='git status'
alias gsh='git status ./'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdch='git diff --cached ./'
alias gdh='git diff ./'
alias gac='git add . && git commit'
alias ga='git add'
alias gc='git commit'
alias gpc='git commit -t $GIT_AUTHORS_FILE'
alias gcm='gc -m'
alias gpo='git push origin'
alias gpu='git pull'
alias gpuo='git pull origin master'
alias gp='git push'
alias gr='git reset'
alias grh='git reset --hard'
alias gb='git branch'
alias gch='git checkout'
alias grf='git checkout --'
alias grb='git rebase'
alias grbi='git rebase -i HEAD~12'
alias patchy='git add -p'
alias stash='git stash'
alias poppy='stash pop'
alias gcat='gc --amend'
alias aight='grb --continue'
alias live='gpo $(active_branch)'
alias dirty_rebase='stash && grbi && poppy'
alias gsch='gch $(g branch | fzy)'
alias pr='gd master HEAD'
alias changelist='git diff-tree --no-commit-id --name-only -r'
alias glog='v -c "Glog -100"'
alias scrubby='g clean -fd'

function gnu () {
  git checkout -b $(kabab $@)
}

function gblame () {
  v $1 -c Gblame
}

function sblame () {
  v $(need) -c Gblame
}

function quick_fix () {
  stash && gch master && gnu $1 && poppy
}

function active_branch () {
  git rev-parse --abbrev-ref HEAD
}
