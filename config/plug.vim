" #############################################################################
" Plug configuration
" #############################################################################

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

	" CoC
	" Stable version of coc
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" Colors
	Plug 'joshdick/onedark.vim'

	" nerdtree
	Plug 'scrooloose/nerdtree'
	" Obsession
	Plug 'tpope/vim-obsession'
	" programming language linting
	Plug 'w0rp/ale'
	" light powerline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	" git plugin
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	" C++ Syntax Highlight
	Plug 'octol/vim-cpp-enhanced-highlight'
	" Tags
	Plug 'ludovicchabant/vim-gutentags', { 'for': ['c', 'cpp'] }
	" Plug 'majutsushi/tagbar', { 'for': ['c', 'cpp'] }

	" Navigation
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	" Vim Wiki
	Plug 'vimwiki/vimwiki'
	" Taskwarrior
	Plug 'blindFS/vim-taskwarrior'

	call plug#end()
