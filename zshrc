# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it"ll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"


# ----------------------------------------
# Donielle Custom
bindkey -v
autoload -U colors && colors
autoload -U compinit; compinit

# Git prompt
autoload -Uz vcs_info




# Default completion style is quite plain and ugly. If you want to improve its appearance, enter the following commands:
zstyle ":completion:*:descriptions" format "%U%B%d%b%u"
zstyle ":completion:*:warnings" format "%BSorry, no matches for: %d%b"
zstyle ":completion:*" completer _complete _ignored _files
zle -C complete-file complete-word _generic
zstyle ":completion:complete-file::::" completer _files
zstyle ":completion:*" verbose yes
bindkey "^xF" complete-file






# PATHS
export PATH=""
export PATH="/usr/local/bin" # Make Homebrew first
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:/Applications/Postgres.app/Contents/MacOS/bin" # Add Postgres
export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin" # System
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM bin to $PATH

export PATH="./node_modules/.bin:$PATH" # Always use local npm module first.
export PATH="$PATH:/usr/local/share/npm/bin" # Add npm apps
export PATH="$PATH:/usr/local/bin:/usr/bin" # To use macvim


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


# This loads nvm
export NVM_DIR="/Users/d.berg/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Automatically runs nvm in directories that contain a .nvmrc file to determine which node/npm to use
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  fi
}
add-zsh-hook chpwd load-nvmrc

source $HOME/.nvm/nvm.sh

# SFDC BLT
export P4PORT=ssl:p4proxy.soma.salesforce.com:1999

# ----------------------------------------

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
DISABLE_UNTRACKED_FILES_DIRTY="true"

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
plugins=(git)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR="vim"
# else
#   export EDITOR="mvim"
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# NAVIGATION
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# LISTING OUT STUFF
alias h=history
alias ls="ls -F"
alias l="ls"
alias la="l -a"
alias ll="l -l -gho"
alias lla="ll -a"
alias lltr="ll -tr"
alias llrt="ll -rt"

# GIT
alias gcl="git clone"
alias ga="git add ."
alias gu="git add --update"
alias gc="git commit -m"
alias gca="git commit --amend"
alias gcnv="git commit --no-verify"
alias gpl="git pull"
alias gps="git push"
alias gips="git push -u origin master"   #initial git push
alias gco="git checkout"
alias gnb="git checkout -b"
alias grs="git reset --soft HEAD~1"

alias gs="git status"
alias gl="git log"
alias glp="git log --all --graph --decorate --oneline --simplify-by-decoration"
alias gh="log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short"
alias gd="git diff"

alias gbl="git branch -l"
alias gbd="git branch -D"
alias grbd="git push origin --delete"
alias gbps="git push --set-upstream origin"

alias gst="git stash"
alias gm="git merge"
alias guns="git unstage"
alias gunc="git uncommit"
alias grbh="git rebase -i HEAD~"

alias grv="git remote -v"
alias grr="git remote rm"
alias gra="git remote add"

alias sshAdd="ssh-add -K ~/.ssh/id_rsa"

alias vpi="vim +PluginInstall +qall" # This installs all vim plugins via vundle

# Colorize output, add file type indicator, and put sizes in human readable format
alias ls="ls -GFh"

# Same as above, but in long listing format
alias ll="ls -GFhl"
alias l="ls -Gfoa"

# for Salesforce matrix team
alias dcp="ssh dev-construct-proxy"
alias grd="sudo grunt rundev"
alias waveServer="PORT=8000 DATA_DIR=/Users/d.berg/Code/WaveUI WAVEBRANCH=master ./run.sh queryserver"
alias waveMakeAll="make clean setup; make"

# Use modern regexps for sed, i.e. "(one|two)", not "\(one\|two\)"
alias sed="sed -E"

alias prettyjson="python -m json.tool"
alias prettyxml="xmllint --format -"

alias py-server="python -m SimpleHTTPServer"

alias use="nvm use"
