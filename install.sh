#!/usr/bin/env bash

OS=$(uname)
INSTALL_DIR=$HOME"/.dotfiles"

# Generic
PROJECTS_DIR=$HOME/Projects
mkdir $PROJECTS_DIR
ln -sf $INSTALL_DIR/.bin ~/bin

# CONSOLE
# ###########
#ln -sf $INSTALL_DIR/.bash_profile ~/.bash_profile
ln -sf $INSTALL_DIR/.zshrc ~/.zshrc

#if [ ! -d "$INSTALL_DIR/base16-shell" ]; then
#    git clone https://github.com/chriskempson/base16-shell $INSTALL_DIR/base16-shell
#fi

#if [ $OS = 'Darwin' ]; then
#    rm $HOME"/.profile"
#    echo ". ~/.bash_profile" > $HOME"/.profile"
#else
#    rm $HOME"/.bashrc"
#    echo ". ~/.bash_profile" > $HOME"/.bashrc"

#   if [ ! -d $INSTALL_DIR/bash-git-prompt ]; then
#       git clone https://github.com/magicmonty/bash-git-prompt $INSTALL_DIR/bash-git-prompt
#    fi
#fi

#ln -sf $INSTALL_DIR/.bash_aliases ~/.bash_aliases

# VIM
# ############
rm ~/.vim
ln -s ~/.dotfiles/.vim ~/.vim
if  [ ! -d $INSTALL_DIR/.vim/bundle ]; then
    mkdir $INSTALL_DIR/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git $INSTALL_DIR/.vim/bundle/Vundle.vim
fi


# GIT
# ############
ln -sf $INSTALL_DIR/.gitconfig ~/.gitconfig
ln -sf $INSTALL_DIR/.gitignore_global ~/.gitignore_global


# Tmux
# ############
#if [ ! -d $INSTALL_DIR/.tmux/plugins ]; then
#    mkdir -p $INSTALL_DIR/.tmux/plugins
#    git clone https://github.com/tmux-plugins/tpm.git $INSTALL_DIR/.tmux/plugins/tpm
#fi
#ln -sf $INSTALL_DIR/.tmux.conf ~/.tmux.conf
#ln -sf $INSTALL_DIR/.tmux ~/.tmux

# IRSSI - Don't forget to set Freenode password
#ln -sf $INSTALL_DIR/.irssi ~/.irssi

# Anaconda
# ############
#ln -sf $INSTALL_DIR/.condarc ~/.condarc

# Go env
# #############
# mkdir -p $PROJECTS_DIR/golang/bin $PROJECTS_DIR/golang/src $PROJECTS_DIR/golang/pkg

# install composer
# composer auto-complete : composer global require bamarni/symfony-console-autocomplete
