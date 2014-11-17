These are my personal dotfiles. Feel free to browse through them and copy whatever takes your fancy.

To use this:

 1. Install rbenv and a recent version of ruby
 2. Install the `homesick` gem and clone this repo
 
    gem install homesick
    homesick clone ariejan/dotfiles
    homesick symlink dotfiles
    
 3. Install Vim plugins using vundle
 
    cd ~/.homesick/repos/dotfiles
    git submodule update --init --recursive
    vim +BundleInstall +qall
