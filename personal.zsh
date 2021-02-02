alias cddotfiles='cd ~/.dotfiles'
alias cdkey='cd ~/personal/code/qmk_firmware'

function backup() {
  rsync -rua --info=progress2 --exclude-from="$HOME/.dotfiles/rsync-ignore.txt" ~/personal /Volumes/nick/backups
}

