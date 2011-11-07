These are just my dotfiles. Feel free to look through them to see if there's anything
useful for you.

setopt interactivecomments

# install rvm and compile ruby 1.9.2
bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi
rvm get head
rvm reload
rvm install 1.9.2
rvm use 1.9.2 --default

# Clone dotfiles
gem install homesick
homesick clone jnimety/dotfiles
homesick symlink jnimety/dotfiles

# install janus vimfiles
git clone git://github.com/carlhuda/janus.git ~/.vim
cd ~/.vim
rake

# install oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
