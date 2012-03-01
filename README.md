These are my personal dotfiles. Feel free to browse through them and copy whatever takes your fancy.

To use this:

## install rvm and compile ruby 1.9.3
    bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
    source ~/.rvm/scripts/rvm
    
    rvm requirements
    rvm install 1.9.3
    rvm use 1.9.3 --default

## install oh-my-zsh

    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

## Clone dotfiles

    gem install homesick
    homesick clone ariejan/dotfiles
    homesick symlink ariejan/dotfiles

