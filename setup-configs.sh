#! /bin/bash

git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
ln -s $(pwd)/.vim $HOME/
ln -s $(pwd)/.vimrc $HOME/
ln -s $(pwd)/bash.bashrc $HOME/.bashrc
