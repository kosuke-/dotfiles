#-----------------------------
# terminal
#-----------------------------
PS1="\h [\W/]\$ "

#-----------------------------
# alias for common
#-----------------------------
alias ls='ls -F -G'
alias la='ls -la'
alias ll='ls -l'
alias rm='rm -iv'
alias mv='mv -iv'
alias view='vim -R'
alias cp='cp -i'

#-----------------------------
# COLOR for common
#-----------------------------
# grep 検索ワードを色づけ(--color=auto)
export GREP_COLOR='1;37;41'

#-----------------------------
# grep for common
#-----------------------------
# -Eオプションは、拡張正規表現を使用する場合に指定
alias grep='grep -E --color=auto'

# 再帰的 grep .svnは除外
alias rgrep='find . -name "*.svn*" -prune -o -type f -print0 | xargs -0 grep --color=auto'

# 個人 bashのロード
if [ -f ~/.bashrc_private ]; then
  source ~/.bashrc_private
fi

