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
  LAST_BRANCH=$(head -n 1 $STACK_CACHE_FILE)
  NEW_LIST=$(tail -n +2 $STACK_CACHE_FILE)
  echo $NEW_LIST > $STACK_CACHE_FILE
  echo $LAST_BRANCH
}

function pop_and_checkout () {
  gch $(pop_branch_stack)
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
