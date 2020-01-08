# PATHS
export PATH=''
export PATH="/usr/local/bin" # Make Homebrew first
export PATH="$PATH:~/bin"
export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin" # System

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# NPM
export PATH="$PATH:/usr/local/share/npm/bin"

# MACVIM
export PATH="$PATH:/usr/local/bin:/usr/bin"

# HEROKU TOOLBELT
export PATH="/usr/local/heroku/bin:$PATH"
export MATRIX_HOME=/Users/d.berg/Matrix

# SFDC Perforce
export P4PORT=ssl:p4proxy.soma.salesforce.com:1999
export GPG_TTY=$(tty)

