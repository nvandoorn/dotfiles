# The following functions help me put git author information into a file, later
# loaded when committing (e.g git commit --template .git-commit-authors.txt)
export GIT_AUTHORS_FILE=".git-commit-authors.txt"

function find_author () {
  cat $DOTFILES_PATH/git-authors.txt | fzy
}

function add_author () {
  echo "Co-authored-by: $(find_author)" >> $GIT_AUTHORS_FILE
}

function show_authors () {
  cat $GIT_AUTHORS_FILE
}

function clear_authors () {
  rm $GIT_AUTHORS_FILE
}

function pair_commit () {
  git commit -t $GIT_AUTHORS_FILE
}
