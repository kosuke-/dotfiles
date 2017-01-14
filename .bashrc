#-----------------------------
# alias
#-----------------------------
alias vi='vim'
alias ls='ls -F -G'
alias la='ls -la'
alias ll='ls -l'
alias rm='rm -iv'
alias mv='mv -iv'
alias view='vim -R'
alias cp='cp -i'
alias grep='grep -E --color=auto'
alias rgrep='find . -name "*.svn*" -prune -o -type f -print0 | xargs -0 grep --color=auto'

export GREP_COLOR='1;37;41'

#-----------------------------
# local
#-----------------------------
if [ -f ~/.bashrc.local ]; then
  source ~/.bashrc.local
fi

#-----------------------------
# git
#-----------------------------
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_SHOWUPSTREAM=1
  export GIT_PS1_SHOWUNTRACKEDFILES=
  export GIT_PS1_SHOWSTASHSTATE=1
fi

#-----------------------------
# other os
#-----------------------------
if [ "$(uname)" == 'Linux' ]; then
  if [ -f ~/.bashrc_raspbian ]; then
    source ~/.bashrc_raspbian
  fi
  if [ -f ~/.bashrc_centos ]; then
    source ~/.bashrc_centos
  fi
fi
if [ "$(uname)" == 'Darwin' ]; then
  if [ -f ~/.bashrc_osx ]; then
    source ~/.bashrc_osx
  fi
fi

#-----------------------------
# terminal
#-----------------------------
PS1='\u@\h [\W]$(__git_ps1 " (%s)")\$ '

