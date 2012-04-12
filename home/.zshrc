# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Map vi to vim, just in case
alias vi=vim

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="ariejan"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

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

# rbenv

###
local user='%{$fg[blue]%}%n@%{$fg[blue]%}%m%{$reset_color%}'
local pwd='%{$fg[blue]%}%~%{$reset_color%}'
local prompt='%{$fg[blue]%}>%{$reset_color%}'
# local return_code='%(?..%{$fg[red]%}%? ↵ %{$reset_color%})'
local git_branch='%{$reset_color%}$(git_prompt_info)$(git_prompt_ahead)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}"
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
PROMPT="${pwd} ${git_branch} ${prompt} "

if [[ -s ~/.rvm/scripts/rvm ]] ; then
    source ~/.rvm/scripts/rvm
    rvm use default > /dev/null
fi

# if [[ -s ~/.rvm/scripts/rvm ]] ; then
#     local rvm='%{$fg[blue]%}‹$(rvm-prompt i v p g)›%{$reset_color%}'
#     source ~/.rvm/scripts/rvm
#     rvm use default > /dev/null
#     PPROMPT="${return_code} ${git_branch} ${rvm}"
# else
#     PATH="$HOME/.rbenv/bin:/usr/local/bin:$PATH"
#     eval "$(rbenv init -)"
#     local rbenv='%{$fg[blue]%}‹$(rbenv version-name)›%{$reset_color%}'
#     RPROMPT="${return_code} ${git_branch} ${rbenv}"
# fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
