These are my personal dotfiles. Feel free to browse through them and copy whatever takes your fancy.

To use this:

 1. Install Homebrew (if OS X)
 
    ```
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ```
 
 2. Install and use zsh
 
    ```
    brew install zsh
    ```
    
    or
    
    ```
    sudo apt-get install zsh
    ```
    
    And change your shell to ZSH
    
    ```
    chsh -s /usr/local/bin/zsh
    ```
 
 3. Install Antigen

    ```
    curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/.antigen.zsh
    ```
    
 4. Install Autoenv
 
   ```
   git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv
   ```
   
 5. Install homesick

    ```
    gem install homesick
    homesick clone ariejan/dotfiles
    homesick symlink dotfiles    
    ```

 6. Close and re-start your terminal to load ZSH and Antigen properly
 
    This will take a moment as it will install the appropriate ZSH plugins.

 7. Install Vim plugins using vundle
 
    ```
    cd ~/.homesick/repos/dotfiles
    git submodule update --init --recursive
    vim +BundleInstall +qall
    ```
    
 7. Install rbenv and ruby-build with a recent version of ruby

    ```
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    rbenv install 2.2.2
    ```
