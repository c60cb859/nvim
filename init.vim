" #############################################################################
" File includes
" #############################################################################

source $HOME/.config/nvim/config/plug.vim
source $HOME/.config/nvim/config/coc.vim
source $HOME/.config/nvim/config/nerdtree.vim
source $HOME/.config/nvim/config/ale.vim
source $HOME/.config/nvim/config/airline.vim
source $HOME/.config/nvim/config/gitgutter.vim
source $HOME/.config/nvim/config/fzf.vim
source $HOME/.config/nvim/config/cpp-enhanced-highlight.vim
source $HOME/.config/nvim/config/vimwiki.vim

source $HOME/.config/nvim/config/keys.vim
source $HOME/.config/nvim/config/whitespace.vim
source $HOME/.config/nvim/config/autocommands.vim

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

" Colorscheme
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
" True colors
if (has("termguicolors"))
  set termguicolors
endif

colorscheme onedark

" Split opening
set splitbelow
set splitright

" UTF8 Support
set encoding=utf-8

" Search
set ignorecase
set smartcase
