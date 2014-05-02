# PATHS
export PATH=''
export PATH="/usr/local/bin" # Make Homebrew first
export PATH="$PATH:~/bin"
export PATH="$PATH:/Applications/Postgres.app/Contents/MacOS/bin" # Add Postgres
export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin" # System
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM bin to $PATH
export PATH="$PATH:/usr/local/share/npm/bin" # Add npm apps

# Aliases
alias git=hub
alias g=hub
alias ls='ls -F'
alias l='ls'
alias la='l -a'
alias ll='l -l -gho'
alias lla='ll -a'
alias lltr='ll -tr'
alias llrt='ll -rt'

# PROMPT

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

