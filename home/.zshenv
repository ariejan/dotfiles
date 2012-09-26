# Paths
export GOPATH="$HOME/go"

# Get GOROOT from go itself, points to the
# currently installed version with Homebrew
for thing in `go env | grep ^GOROOT` ; do export $thing ; done

export PATH="$GOPATH/bin:$PATH"

# Vim FTW
export EDITOR=vim

# Locale
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

eval "$(rbenv init -)"
eval "$(hub alias -s)"
