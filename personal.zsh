# folder alias
alias cddotfiles='cd $HOME/Documents/dotfiles'
alias cdball='cd $HOME/Documents/smartballot'
alias cdone='cd $HOME/Documents/one_feather'
alias supergood='hub pull-request -r jarednorman -r alistairnorman'

# backup helper function
# TODO:
# 1) Re-arrange this such that it can be run on a single folder
#    (e.g make a folder in home that get's backed up and contains these)
# 2) Make sure the permission mask is working properly. I recall having permission
#    issues last time I restored from here
function backup() {
  rsync -rua --info=progress2 --exclude-from="$DOTFILES_PATH/rsync-ignore.txt" $HOME/Documents /Volumes/nick/backups
  rsync -rua --info=progress2 --exclude-from="$DOTFILES_PATH/rsync-ignore.txt" $HOME/Wii /Volumes/nick/backups
  rsync -rua --info=progress2 --exclude-from="$DOTFILES_PATH/rsync-ignore.txt" $HOME/Work /Volumes/nick/backups
  rsync -rua --info=progress2 --exclude-from="$DOTFILES_PATH/rsync-ignore.txt" $HOME/Wallpapers /Volumes/nick/backups
  rsync -rua --info=progress2 --exclude-from="$DOTFILES_PATH/rsync-ignore.txt" $HOME/Pictures /Volumes/nick/backups
}

