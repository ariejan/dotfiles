These are my personal dotfiles, there are may like them, but these are mine.

## macOS installation

```
xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install zsh stow git hub node postgresql reattach-to-user-namespace the_silver_searcher tmux vim wget openssl libyaml libffi
chsh -s `which zsh`
mkdir -p $HOME/bin
curl https://cdn.rawgit.com/zsh-users/antigen/v1.1.4/bin/antigen.zsh > $HOME/bin/antigen.zsh
cd $HOME
git clone --recursive git@github.com:ariejan/dotfiles.git
cd $HOME/dotfiles
stow git ruby sqlite tmux vim zsh
zsh
vim +BundleInstall +qall
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
$HOM/.rbenv/bin/rbenv init
source $HOME/.zshrc
rbenv install 2.3.1
```

