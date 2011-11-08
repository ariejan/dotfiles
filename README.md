    setopt interactivecomments

## install rvm and compile ruby 1.9.2
    bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
    if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi
    rvm get head
    rvm reload
    rvm install 1.9.2
    rvm use 1.9.2 --default

## install oh-my-zsh

    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

## Clone dotfiles

    gem install homesick
    homesick clone ariejan/dotfiles
    homesick symlink ariejan/dotfiles

## install janus vimfiles

    git clone git://github.com/carlhuda/janus.git ~/.vim
    cd ~/.vim
    rake
