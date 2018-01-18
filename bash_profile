source ~/.git-completion.bash

eval "$(rbenv init -)"

parse_git_branch(){ git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'; }

export EDITOR=mvim
export GREP_OPTIONS='--color=auto'
export PS1='\w $(parse_git_branch)🐖  '

alias b="bundle exec"
alias mvim="/Applications/MacVim.app/Contents/bin/mvim"
alias github_issue_report="docker run --env-file /Users/GordonDiggs/git_repos/issues_by_assignee/.env -it gordondiggs/issues_by_assignee"

down4me() { curl -s "http://www.downforeveryoneorjustme.com/$1" | sed '/just you/!d;s/<[^>]*>//g' ; }
