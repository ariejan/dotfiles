alias g=git
alias gb="git branch -a"

function glh --description 'Show short git log'
  git log --graph --pretty=format:'%Cred%h%Creset %Cblue<%ae>%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative
end

function gst --description 'Show git status'
  git status -sb
end

function gc --description 'Commit staged changes'
  git commit
end
