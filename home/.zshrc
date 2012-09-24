# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

PATH=$PATH:/usr/local/sbin
export EDITOR=vim

# Map vi to vim, just in case
alias vi=vim

# Git aliases
alias glh="git lg | head"

# Uncomment following line if you want red dots to bundlere displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew bundler gem git rails3 redis-cli nyan)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

unsetopt auto_name_dirs

# Easily delete removed files from git index
grm() {
  git status | grep "deleted:" | awk '{print $3}' | xargs git rm --ignore-unmatch
}

# hub
eval "$(hub alias -s)"

# rbenv

###
local user='%{$fg[blue]%}%n@%{$fg[blue]%}%m%{$reset_color%}'
local pwd='%{$fg[blue]%}%~%{$reset_color%}'
local prompt=' %{$fg[blue]%}>%{$reset_color%}'
# local return_code='%(?..%{$fg[red]%}%? ↵ %{$reset_color%})'
local git_branch='%{$reset_color%}$(git_prompt_info)$(git_prompt_ahead)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✖"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_AHEAD=""

# ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[red]%} ✚"
# ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[red]%} ✹"
# ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
# ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[red]%} ➜"
# ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%} ═"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%} ✭"

# PROMPT="${user} ${pwd} $ "
PROMPT="${pwd}${git_branch}${prompt} "

if [[ -s ~/.rvm/scripts/rvm ]] ; then
    source ~/.rvm/scripts/rvm
    rvm use default > /dev/null
fi

if [[ -s ~/.rvm/scripts/rvm ]] ; then
    local rvm='%{$fg[blue]%}‹$(rvm-prompt i v p g)›%{$reset_color%}'
    source ~/.rvm/scripts/rvm
    rvm use default > /dev/null
    # PPROMPT="${return_code} ${git_branch} ${rvm}"
else
    PATH="$HOME/.rbenv/bin:/usr/local/bin:$PATH"
    # eval "$(rbenv init -)"
    # local rbenv='%{$fg[blue]%}‹$(rbenv version-name)›%{$reset_color%}'
    # RPROMPT="${return_code} ${git_branch} ${rbenv}"
fi

# Disable the mostly annoying auto correct
unsetopt correct_all
