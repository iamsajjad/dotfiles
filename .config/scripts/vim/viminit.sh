#!/usr/bin/env bash

# ... viminit.sh

# install requirements
python -m pip install --user --upgrade setuptools pip
python -m pip install --user neovim

# install vim plug plugins manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install plugins
vim +PlugInstall +PlugUpdate +PlugUpgrade +qall

echo "script @ vim/viminit.sh done."

