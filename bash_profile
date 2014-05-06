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

