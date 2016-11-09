# Antigen
source $HOME/bin/antigen.zsh

antigen use oh-my-zsh
antigen theme ariejan/dotfiles data/themes/af-magic-mod

antigen bundles <<EOBUNDLES
  bundler
  command-not-found
  rbenv
  zsh-users/zsh-syntax-highlighting
  jimhester/per-directory-history
EOBUNDLES

antigen apply

# Set path correctly for Homebrew
PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Node.js Global
export PATH=/usr/local/share/npm/bin:$PATH

# Golang Global
export PATH="$PATH:$GOPATH/bin"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Map vi to vim, just in case
alias vi=vim
alias :e=vim

# Tmux
alias tl="tmux list-sessions"
alias ta="tmux attach-session -t"

# Rails
alias migrate="rake db:migrate db:test:prepare"
alias remigrate="rake db:drop db:create db:migrate db:test:prepare"
alias seed="rake db:seed"

alias cuke="clear && rake cucumber"
alias wip="clear && rake cucumber:wip"

migration() {
  rails generate migration $1 | grep create | tr -s ' ' | cut -d ' ' -f 3 | xargs -o vim -f --
}

# Hub
alias hb="hub browse"

# Git aliases
alias g="git"
alias gst="git status -sb"
alias gco="git checkout"
alias gpom="git push origin master"
alias glog='git log --pretty=format:"%C(yellow)%h%C(reset) %C(green)%ar%C(reset) %C(bold blue)%an%C(reset) %C(red)%d%C(reset) %s" --graph --abbrev-commit --decorate'
alias gd="git diff"
alias gap="git add -p"
alias gaa="git add ."
alias gc="git commit"
alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch -D"
alias gca="git commit --amend"
alias gmc='git ls-files --unmerged | cut -f2 | uniq' # git merge conflicts
alias glh="git lg | head -n 42"
alias grv="git remote -v"
alias gfo="git fetch origin"
alias gclr="git reset HEAD --hard ; git clean -fd"
alias gz="git archive -o snapshot.zip HEAD"
alias gt="git archive -o snapshot.tar.gz HEAD"
alias gpr="git --no-pager lg HEAD --not $1"
alias grp="git remote prune origin"
alias grhh="git reset HEAD --hard"

# Easily delete removed files from git index
grm() {
  git status | grep "deleted:" | awk '{print $2}' | xargs git rm --ignore-unmatch
}

# Bundler
alias bi="bundle install"
alias be="bundle exec"
alias bu="bundle update"

# Hanami
alias h="hanami"
alias hg="hanami generate"
alias ha="hanami action"

# tree
alias t="tree --noreport -p -u -g -h --du -F -A -C"

# Uncomment following line if you want red dots to bundlere displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Customize to your needs...
unsetopt auto_name_dirs

# Disable the mostly annoying auto correct
unsetopt correct_all

# Load keys into ssh-agent
ssh-add &>/dev/null
