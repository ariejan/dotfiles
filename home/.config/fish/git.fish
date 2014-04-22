alias g=git
alias gst="git status -sb"
alias gb="git branch -a"
alias glh="git log --graph --pretty=format:'%Cred%h%Creset %Cblue<%ae>%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gc="git commit"
alias gco="git checkout"
alias gb="git branch"
alias gba="git branch -a"
alias grv="git remote -v"
alias gclr="git reset HEAD --hard ; git clean -fd"
alias gz="git archive -o snapshot.zip HEAD"
alias gt="git archive -o snapshot.tar.gz HEAD"

function grm
  git status | grep "deleted:" | awk '{print $2}' | xargs git rm --ignore-unmatch
end
