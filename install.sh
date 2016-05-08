#!/bin/bash

DEST=$HOME
ORIGIN=$PWD
DOT_FILES=( \
  .bashrc \
  .bash_profile \
  .gitconfig \
  .git-completion.bash \
  )

for file in ${DOT_FILES[@]}
do
  if [ -a $DEST/$file ]; then
    ln -s $ORIGIN/$file $DEST/$file.dot
    echo "既にファイルが存在します。"
    echo ".dotファイルを作成します。: $file"
  else
    ln -s $ORIGIN/$file $DEST/$file
    echo "シンボリックリンクを貼りました: $file"
  fi
done
