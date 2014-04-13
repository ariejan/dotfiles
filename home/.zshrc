# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(bundler rails git ruby rvm osx)
plugins=(rails git ruby rvm osx)

source $ZSH/oh-my-zsh.sh

PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Node.js Global
export PATH=/usr/local/share/npm/bin:$PATH

# Golang Global
export PATH="$PATH:$GOPATH/bin"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Map vi to vim, just in case
alias vi=vim

alias j6='export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home'

# Make working with ~/.zshrc quicker
alias reload='source ~/.zshrc'
alias ea='vim ~/.zshrc && reload' # Edit aliases

# Tmux
alias tl="tmux list-sessions"
alias ta="tmux attach-session -t"

# Rails
alias migrate="rake db:migrate db:test:prepare"
alias remigrate="rake db:drop db:create db:migrate db:test:prepare"
alias seed="rake db:seed"

alias rs="clear && rspec"
alias rsa="clear && rspec spec/api"
alias rsm="clear && rspec spec/models"
alias rsd="clear && rspec spec/decorators"
alias rsj="clear && rspec spec/jobs"

alias cuke="clear && rake cucumber"
alias wip="clear && rake cucumber:wip"

# Pow
alias rst="touch tmp/restart.txt"

migration() {
  rails generate migration $1 | grep create | tr -s ' ' | cut -d ' ' -f 3 | xargs -o vim -f --
}

# Hub
alias hb="hub browse"

# Git Doge aliases
alias such=git
alias many=git
alias very=git
alias wow='git status'

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
alias glh="git lg | head"
alias grv="git remote -v"
alias gfo="git fetch origin"
alias gclr="git reset HEAD --hard ; git clean -fd"
alias gz="git archive -o snapshot.zip HEAD"
alias gt="git archive -o snapshot.tar.gz HEAD"
alias gpr="git --no-pager lg HEAD --not $1"
alias grp="git remote prune origin"
alias grhh="git reset HEAD --hard"

# Bundler
alias bi="bundle install"
alias be="bundle exec"
alias bu="bundle update"

# Force the use of Heroku Toolbelt
# instead of a locally installed gem
alias heroku="/usr/bin/heroku"

# Easily delete removed files from git index
grm() {
  git status | grep "deleted:" | awk '{print $2}' | xargs git rm --ignore-unmatch
}

# Uncomment following line if you want red dots to bundlere displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"


# Customize to your needs...
unsetopt auto_name_dirs

# Disable the mostly annoying auto correct
unsetopt correct_all

function pp() {
  pygmentize -O 'bg=dark,style=vim' -f terminal256 "$1" 
}

### Zsh Prompt
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}•" 
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{$fg[blue]%}>%{$reset_color%} '
RPROMPT='%{$fg[blue]%}%2c$(git_prompt_info) %{$reset_color%}%{$fg[red]%}$(~/.rvm/bin/rvm-prompt) %{$fg[blue]%}%n@%M%{$reset_color%}'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
