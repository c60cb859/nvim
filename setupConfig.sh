#!/bin/bash

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +UpdateRemotePlugins +qall
nvim +PlugClean +PlugInstall +PlugUpdate +UpdateRemotePlugins +qall
