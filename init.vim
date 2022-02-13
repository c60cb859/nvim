" #############################################################################
" File includes
" #############################################################################

source $HOME/.config/nvim/config/plug.vim
source $HOME/.config/nvim/config/nerdtree.vim
source $HOME/.config/nvim/config/airline.vim
source $HOME/.config/nvim/config/gitgutter.vim
source $HOME/.config/nvim/config/fzf.vim
source $HOME/.config/nvim/config/cpp-enhanced-highlight.vim
source $HOME/.config/nvim/config/vimwiki.vim
source $HOME/.config/nvim/config/cppman.vim
source $HOME/.config/nvim/config/fswitch.vim

source $HOME/.config/nvim/config/keys.vim
source $HOME/.config/nvim/config/folds.vim
source $HOME/.config/nvim/config/whitespace.vim
source $HOME/.config/nvim/config/autocommands.vim

lua require('lsp')

" #############################################################################
" Lua fun
" #############################################################################

"lua require('basic')

" #############################################################################
" Basic vim configuration
" #############################################################################

syntax on "syntax highlight
set autoindent
set number "line numbering
set numberwidth=1
set relativenumber
set cursorline "highlight cursorline
set noswapfile "turn off swap files
set backspace=indent,eol,start "allow backspacing over everything in insert mode

" Default tabs
set shiftwidth=4
set tabstop=4

" Use system clipboard (xclip)
set clipboard=unnamedplus

" onedark true color (24 bit)
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

colorscheme onedark

" Split opening
set splitbelow
set splitright

" UTF8 Support
set encoding=utf-8

" Search
set ignorecase
set smartcase
