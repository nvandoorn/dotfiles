# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
DEFAULT_USER="nick"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git async)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

export VISUAL=nvim
export EDITOR="$VISUAL"
export PATH="$PATH:/Users/nick/Documents/google-cloud-sdk/bin"

export TTC_REPOS='~/Documents/slask,~/Documents/portfolio,~/Documents/dotfiles,~/Documents/getslask.com,~/Documents/webpack2-react-starter,~/Documents/BRNKL-app,~/Documents/BRNKL-IoT-Server,~/Documents/BRNKL-rest-api'
export TTC_REPOS_DEPTH=2
export TTC_GITBOT='gitlog'
export TTC_WEATHER='Victoria, BC'
export TTC_SAY_BOX='parrot'
export TTC_APIKEYS=false

alias vi=nvim
alias gs='git status'
alias gdc='git diff --cached'
alias gd='git diff'
alias gac='git add-commit'
alias ga='git add'
alias gc='git commit'
alias gpo='git push origin'
alias gr='git reset'
alias grh='git reset --hard'
alias gb='git branch'
alias gch='git checkout'

alias cdrio='cd ~/Documents/rio/'
alias cdslask='cd ~/Documents/slask'
alias cdport='cd ~/Documents/portfolio'
alias cddotfiles='cd ~/Documents/dotfiles'
alias cdbapp='cd ~/Documents/BRNKL-app'
alias cdbapi='cd ~/Documents/BRNKL-rest-api'
alias cdbiot='cd ~/Documents/BRNKL-IoT-Server'
alias cdbwiki='cd ~/Documents/BRNKL-IoT-Server.wiki'
alias sshlegato='ssh nick@192.168.0.160'
alias cdbfunc='cd ~/Documents/brnkl-firebase-functions'

alias cfglegato cfglegato='pushd . && cd ~/Documents/legato_framework/legato && source ./bin/configlegatoenv ; popd'

if [[ `uname` == 'Linux' ]]; then
  cfglegato
fi
