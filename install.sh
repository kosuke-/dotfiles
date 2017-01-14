#!/bin/bash

CMDNAME=`basename $0`

detail_usage() {
  echo "Usage: $CMDNAME [-i] [-d] [-h]"
  echo
  echo "Options:"
  echo "  -i   : install"
  echo "  -d   : clean up backupfile"
  echo "  -h   : help"
  echo
  exit 1
}

if [ $# -le 0 ] ; then
  detail_usage
fi

while getopts idh OPTION
do
  case $OPTION in
    "i" ) OPT_I="TRUE" ;;
    "d" ) OPT_D="TRUE" ;;
    "h" ) detail_usage ;;
     -* ) detail_usage ;;
      * ) detail_usage ;;
  esac
done


DEST=$HOME
ORIGIN=$PWD
DOT_FILES=( \
  .bashrc \
  .bash_profile \
  .gitconfig \
  .git-completion.bash \
  .git-prompt.sh \
  .vimrc \
  .gvimrc \
  )

if [ "$OPT_I" = "TRUE" ]; then
  for file in ${DOT_FILES[@]}
  do
    if [ -a $DEST/$file ]; then
      echo "$file"
      rm -f $DEST/$file~
      cp -f $DEST/$file $DEST/$file~
      echo "既にファイルが存在します: $file"
      echo "バックアップを作成します: $DEST/$file~"
      rm -f $DEST/$file
    else
      echo "$file"
    fi
    ln -sF $ORIGIN/$file $DEST/$file
    echo "シンボリックリンクを貼りました"
    echo ""
  done
fi

if [ "$OPT_D" = "TRUE" ]; then
  for file in ${DOT_FILES[@]}
  do
    if [ -a $DEST/$file~ ]; then
      echo "$DEST/$file~"
      rm -f $DEST/$file~
    fi
    echo ""
  done
fi
