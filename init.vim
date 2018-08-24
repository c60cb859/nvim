" #############################################################################
" File includes
" #############################################################################

source $HOME/.config/nvim/config/vundle.vimrc
source $HOME/.config/nvim/config/nerdtree.vimrc
source $HOME/.config/nvim/config/ale.vimrc
source $HOME/.config/nvim/config/airline.vimrc
source $HOME/.config/nvim/config/gitgutter.vimrc

source $HOME/.config/nvim/config/keys.vimrc
source $HOME/.config/nvim/config/whitespace.vimrc
source $HOME/.config/nvim/config/ansible.vimrc
source $HOME/.config/nvim/config/python.vimrc

" #############################################################################
" Basic vim configuration
" #############################################################################

syntax on "syntax highlight
set autoindent
set number "line numbering
set cursorline "highlight cursorline
set noswapfile "turn off swap files
set backspace=indent,eol,start "allow backspacing over everything in insert mode

" Default tabs
set shiftwidth=4
set tabstop=4

" Colorscheme
set bg=dark
set t_Co=256
colorscheme xoria256

" Split opening
set splitbelow
set splitright

" UTF8 Support
set encoding=utf-8

" Search
set ignorecase
set smartcase
