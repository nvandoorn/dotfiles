alias gs='git status'
alias gsh='git status ./'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdch='git diff --cached ./'
alias gdh='git diff ./'
alias gac='git add-commit'
alias ga='git add'
alias gc='git commit'
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
alias gnu='git checkout -b'
alias grb='git rebase'
alias grbi='git rebase -i HEAD~12'
alias patchy='git add -p'
alias stash='git stash'
alias poppy='stash pop'
alias gcat='gc --amend'
alias aight='grb --continue'
alias live='gpo $(active_branch)'
alias dirty_rebase='stash && grbi && poppy'

function quick_fix () {
  stash && gch master && gnu $1 && poppy
}

function active_branch () {
  git rev-parse --abbrev-ref HEAD
}

export STACK_CACHE_FILE=".git-branch-stack.txt"

function push_to_branch_stack () {
  if [ -z "$1" ]
  then
    BRANCH_NAME=$(active_branch)
  else
    BRANCH_NAME=$1
  fi
  echo $BRANCH_NAME >> $STACK_CACHE_FILE
}

function list_branch_stack () {
  cat $STACK_CACHE_FILE
}

function pop_branch_stack () {
  head -n -1 $STACK_CACHE_FILE > $STACK_CACHE_FILE.tmp ; mv $STACK_CACHE_FILE.tmp $STACK_CACHE_FILE
}

function clear_branch_stack () {
  rm $STACK_CACHE_FILE
}

function rebase_each () {
  # iterate over each branch in our stack
  while read in
  do
    git checkout $in
    git rebase $1
  done < $STACK_CACHE_FILE
  git checkout master
}

function push_each () {
  # iterate over each branch in our stack
  while read in
  do
    git checkout $in
    git push -f origin $in
  done < $STACK_CACHE_FILE
  git checkout master
}

function delete_each () {
  while read in
  do
    git branch -D $in
  done < $STACK_CACHE_FILE
}

function try_it () {
  gnu $1 $2/$1
}
