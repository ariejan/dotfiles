These are my personal dotfiles. Feel free to browse through them and copy whatever takes your fancy.

To use this:

## install rvm and compile a recent version of ruby
    \curl -sSL https://get.rvm.io | bash
    
    rvm requirements
    rvm install 2.1.0
    rvm use 2.1.0 --default

## install oh-my-zsh

    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

## Clone dotfiles

    gem install homesick
    homesick clone ariejan/dotfiles
    homesick symlink ariejan/dotfiles

## Vim Setup

Vim plugins are managed using Vundle and installed in `~/.vundle.local`. 

To install all configured plugins, simple start vim and run `:BundleInstall`.

