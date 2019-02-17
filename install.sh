#!/bin/bash

DOTFILES_DIR=$(pwd)
ZDOTDIR=$HOME/.config/zsh
VIMDIR=$HOME/.config/vim
ZSHENV_LOCAL_FILE=$ZDOTDIR/zshenv_local

createZshEnvInitFile () {
  local ZSHENV_INIT_FILE=$HOME/.zshenv
  echo "export ZDOTDIR=$1" > $ZSHENV_INIT_FILE
  echo 'source $ZDOTDIR/zshenv' >> $ZSHENV_INIT_FILE
}

createDirIfDoesntExist () {
  if [ ! -d "$1" ]; then
    mkdir -p $1
  fi
}

createFileIfDoesntExist () {
  if [ ! -f "$1" ]; then
    touch $1
  fi
}

createZshEnvInitFile $ZDOTDIR
createDirIfDoesntExist $ZDOTDIR
createDirIfDoesntExist $VIMDIR
createFileIfDoesntExist $ZSHENV_LOCAL_FILE

# create symlinks
ln -s $DOTFILES_DIR/zshenv $ZDOTDIR/zshenv
ln -s $DOTFILES_DIR/Xresources $HOME/.Xresources
ln -s $DOTFILES_DIR/vimrc $VIMDIR/vimrc
