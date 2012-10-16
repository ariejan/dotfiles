# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

PATH=$PATH:/usr/local/sbin

# Map vi to vim, just in case
alias vi=vim

# Tmux
alias tl="tmux list-sessions"
alias ta="tmux attach-session -t"

# Git aliases
alias glh="git lg | head"
alias grv="git remote -v"

alias heroku="/usr/bin/heroku"

# Easily delete removed files from git index
grm() {
  git status | grep "deleted:" | awk '{print $3}' | xargs git rm --ignore-unmatch
}

# Uncomment following line if you want red dots to bundlere displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew bundler gem git rails3 redis-cli nyan osx heroku)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
unsetopt auto_name_dirs

# Disable the mostly annoying auto correct
unsetopt correct_all

### Zsh Prompt
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}•" 
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{$fg[blue]%}>%{$reset_color%} '
RPROMPT='%{$fg[white]%}%2c$(git_prompt_info) %{$reset_color%}%{$fg[blue]%}%n@%M%{$reset_color%}'
