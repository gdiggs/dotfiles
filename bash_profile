source ~/.git-completion.bash

if [ -x "$(command -v rbenv)" ]; then
  eval "$(rbenv init -)"
fi

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

parse_git_branch(){ git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'; }

hostname_if_ssh(){
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    echo "[$(hostname)] "
  fi
}

export EDITOR=mvim
export GREP_OPTIONS='--color=auto'
export PS1='$(hostname_if_ssh)\w $(parse_git_branch)🐖 '

alias b="bundle exec"
alias mvim="/Applications/MacVim.app/Contents/bin/mvim"
alias github_issue_report="docker run --env-file /Users/GordonDiggs/git_repos/issues_by_assignee/.env -it gordondiggs/issues_by_assignee"

down4me() { curl -s "http://www.downforeveryoneorjustme.com/$1" | sed '/just you/!d;s/<[^>]*>//g' ; }

source ~/.bash_profile.local
