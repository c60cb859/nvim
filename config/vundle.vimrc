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
" dark low contrast colorsheme
Plugin 'vim-scripts/xoria256.vim'
" dark high contrast colorsheme
Plugin 'tomasr/molokai'
" nerdtree
Plugin 'scrooloose/nerdtree'
" programming language linting
Plugin 'w0rp/ale'
" light powerline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" git plugin
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
" Ansible plugin
Plugin 'pearofducks/ansible-vim'

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
