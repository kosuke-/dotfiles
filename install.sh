#!/bin/bash

DEST=$HOME
ORIGIN=$PWD
DOT_FILES=( \
  .bashrc \
  .bash_profile \
  .gitconfig \
  .git-completion.bash \
  .vimrc \
  .gvimrc \
  )

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
  ln -s $ORIGIN/$file $DEST/$file
  echo "シンボリックリンクを貼りました"
  echo ""
done
