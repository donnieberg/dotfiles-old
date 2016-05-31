# PATHS
export PATH=''
export PATH="/usr/local/bin" # Make Homebrew first
export PATH="$PATH:~/bin"
export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin" # System

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# NVM
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

# NPM
export PATH="$PATH:/usr/local/share/npm/bin"

# MACVIM
export PATH="$PATH:/usr/local/bin:/usr/bin"

# HEROKU TOOLBELT
export PATH="/usr/local/heroku/bin:$PATH"
export MATRIX_HOME=/Users/d.berg/Matrix

# Running Mocha and Karma tests
runTests() {
    testFile=${1}
    if [ $# -eq 0 ]; then
        echo 'Running test suite:'
        sudo grunt karma:unit --debug-test=true
    else
        echo 'Running individual test:'
        sudo mocha --compilers js:babel/register --require test/unit/helper.js $testFile
    fi
}
