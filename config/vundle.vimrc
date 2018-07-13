" #############################################################################
" Vundle configuration
" #############################################################################

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-scripts/xoria256.vim'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'

call vundle#end()

filetype plugin indent on

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
