# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme robbyrussell

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins autojump bundler rvm rake rails localhost

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

set -x GOPATH $HOME/go
set PATH $PATH $GOPATH $GOPATH/bin /usr/local/share/npm/bin

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

function fish_greeting
  set hostname (hostname)
  set machine_release (uname -r)
  set machine_name (uname -s)

  figlet $hostname
  echo "    Welcome to $hostname ($machine_name $machine_release)"
  echo
end

function reload
    echo "Reloading fish configuration"
    . $HOME/.config/fish/config.fish
end

. $HOME/.config/fish//git.fish
