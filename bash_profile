export PATH="/usr/local/bin:/usr/local/sbin:/opt/homebrew/bin:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"

source ~/.git-completion.bash

if [ -x "$(command -v rbenv)" ]; then
  eval "$(rbenv init - bash)"
fi

parse_git_branch(){ git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'; }

hostname_if_ssh(){
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    echo "[$(hostname)] "
  fi
}

export EDITOR=vim
export PS1='$(hostname_if_ssh)\w $(parse_git_branch)🐖 '

alias grep="grep --color=auto"
alias b="bundle exec"
alias github_issue_report="docker run --env-file /Users/GordonDiggs/git_repos/issues_by_assignee/.env -it gordondiggs/issues_by_assignee"
alias plz="sudo"

down4me() { curl -s "http://www.downforeveryoneorjustme.com/$1" | sed '/just you/!d;s/<[^>]*>//g' ; }

source ~/.bash_profile.local

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
