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

" Colors
" dark low contrast colorsheme
Plugin 'vim-scripts/xoria256.vim'
" dark high contrast colorsheme
Plugin 'tomasr/molokai'
Plugin 'joshdick/onedark.vim'

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
" Auto pari quotes and brackets
Plugin 'jiangmiao/auto-pairs'
" Auto completion
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'zchee/deoplete-clang' " { 'for': ['c', 'cpp'] }
Plugin 'zchee/deoplete-jedi' " { 'for': ['python'] }
" Python code reference
Plugin 'davidhalter/jedi-vim' " { 'for': ['python'] }
" C++ Syntax Highlight
Plugin 'octol/vim-cpp-enhanced-highlight'
" Tags
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'
Plugin 'multilobyte/gtags-cscope'

" Navigation
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'


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
