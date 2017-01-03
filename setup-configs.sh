#! /bin/bash

if [ ! -d backups ]
  then
    mkdir backups
fi

mv $HOME/.vim backups/backup.vim
mv $HOME/.vimrc backups/backup.vimrc
mv $HOME/.bashrc backups/backup.bashrc

ln -s $(pwd)/.vim $HOME/
ln -s $(pwd)/.vimrc $HOME/
ln -s $(pwd)/bash.bashrc $HOME/.bashrc
