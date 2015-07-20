#./usr/bin/z.sh

bindkey -v
autoload -U colors && colors
autoload -U compinit; compinit

ZSH_THEME="mh"
DEFAULT_USER="Donielle"


# Default completion style is quite plain and ugly. If you want to improve its appearance, enter the following commands:
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' completer _complete _ignored _files
zle -C complete-file complete-word _generic
zstyle ':completion:complete-file::::' completer _files
zstyle ':completion:*' verbose yes
bindkey '^xF' complete-file


# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
setopt RM_STAR_WAIT

# Jump into directory and run ls.
c() { cd $@; ls }

# NAVIGATION
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# LISTING OUT STUFF
alias h=history
alias ls='ls -F'
alias l='ls'
alias la='l -a'
alias ll='l -l -gho'
alias lla='ll -a'
alias lltr='ll -tr'
alias llrt='ll -rt'

# GIT
alias gcl='git clone'
alias ga='git add --all'
alias gu='git add --update'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gpl='git pull'
alias gps='git push'
alias gips='git push -u origin master'   #initial git push
alias gco='git checkout'
alias gnb='git checkout -b'
alias grs='git reset --soft HEAD~1'

alias gs='git status'
alias gl='git log'
alias gh='log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short'
alias gd='git diff'

alias gbl='git branch -l'
alias gbd='git branch -D'
alias gpsb='git push --set-upstream origin'

alias gst='git stash'
alias guns='git unstage'
alias gunc='git uncommit'

alias grv='git remote -v'
alias grr='git remote rm'
alias gra='git remote add'




alias vpi="vim +PluginInstall +qall" # This installs all vim plugins via vundle

# Colorize output, add file type indicator, and put sizes in human readable format
alias ls='ls -GFh'
# Same as above, but in long listing format
alias ll='ls -GFhl'
alias l='ls -Gfoa'

# Use modern regexps for sed, i.e. "(one|two)", not "\(one\|two\)"
alias sed="sed -E"

alias prettyjson="python -m json.tool"
alias prettyxml="xmllint --format -"

function al { ls -t | head -n ${1:-10}; }


#  ZSH options

HISTFILE=~/.zsh_history
export HISTSIZE=100000
export HISTFILESIZE=$HISTSIZE
export SAVEHIST=$HISTSIZE
setopt no_list_beep
setopt no_beep
setopt auto_list
setopt MENU_COMPLETE
setopt appendhistory
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt autocd
setopt prompt_subst
setopt autopushd

unsetopt correctall
# Allow [ or ] whereever you want
# (Prevents "zsh: no matches found: ...")
unsetopt nomatch

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{yellow}% ☣ '
zstyle ':vcs_info:*' unstagedstr '%F{red}% ☠ '
zstyle ':vcs_info:*' actionformats \
     '%F{5}%F{3} %F{5}%F{2}%b%F{3}|%F{1}%a%F{5}%f '
zstyle ':vcs_info:*' formats       \
     '%F{5}%F{3} %F{5}%F{2}%b%F{5}%f %m%u%c '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r %m%u%c '

zstyle ':vcs_info:*' enable git

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[yellow]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
PROMPT=$'\n%{$reset_color%}$[HISTCMD-1] %F{cyan}%~ $(vcs_info_wrapper) %F{magenta}% \n$ %{$reset_color%}'

# PATHS
export PATH=''
export PATH="/usr/local/bin" # Make Homebrew first
export PATH="$PATH:~/bin"
export PATH="$PATH:/Applications/Postgres.app/Contents/MacOS/bin" # Add Postgres
export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin" # System
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM bin to $PATH
export PATH="$PATH:/usr/local/share/npm/bin" # Add npm apps
export PATH="$PATH:/usr/local/bin:/usr/bin" # To use macvim

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"




