# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Map vi to vim, just in case
alias vi=vim

# Make working with ~/.zshrc quicker
alias reload='source ~/.zshrc'
alias ea='vim ~/.zshrc && reload' # Edit aliases

# Tmux
alias tl="tmux list-sessions"
alias ta="tmux attach-session -t"

# Git aliases
alias g="git"
alias gst="git status"
alias gco="git checkout"
alias gpom="git push origin master"
alias glog='git log --pretty=format:"%C(yellow)%h%C(reset) %C(green)%ar%C(reset) %C(bold blue)%an%C(reset) %C(red)%d%C(reset) %s" --graph --abbrev-commit --decorate'
alias gd="git diff"
alias gap="git add -p"
alias gaa="git add ."
alias gc="git commit"
alias gb="git branch"
alias gba="git branch -a"
alias gca="git commit --amend"
alias gmc='git ls-files --unmerged | cut -f2 | uniq' # git merge conflicts
alias glh="git lg | head"
alias grv="git remote -v"
alias gfo="git fetch origin"
alias gclean="git reset HEAD --hard ; git clean -fd"
alias gz="git archive -o snapshot.zip HEAD"
alias gt="git archive -o snapshot.tar.gz HEAD"

# Bundler
alias bi="bundle install"
alias be="bundle exec"
alias bu="bundle update"

# Force the use of Heroku Toolbelt
# instead of a locally installed gem
alias heroku="/usr/bin/heroku"

# Easily delete removed files from git index
grm() {
  git status | grep "deleted:" | awk '{print $3}' | xargs git rm --ignore-unmatch
}

# Uncomment following line if you want red dots to bundlere displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bundler rails git ruby rvm osx)

source $ZSH/oh-my-zsh.sh

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
RPROMPT='%{$fg[white]%}%2c$(git_prompt_info) %{$reset_color%}%{$fg[red]%}$(~/.rvm/bin/rvm-prompt) %{$fg[blue]%}%n@%M%{$reset_color%}'

# loadrvm

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
