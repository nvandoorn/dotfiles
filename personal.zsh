alias cddotfiles='cd ~/.dotfiles'

function backup() {
  rsync -rua --info=progress2 --exclude-from="$HOME/.dotfiles/rsync-ignore.txt" ~/personal /Volumes/nick/backups
}

