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

	" Colors
	" dark low contrast colorsheme
	Plug 'vim-scripts/xoria256.vim'
	" dark high contrast colorsheme
	Plug 'tomasr/molokai'
	Plug 'joshdick/onedark.vim'

	" nerdtree
	Plug 'scrooloose/nerdtree'
	" programming language linting
	Plug 'w0rp/ale'
	" light powerline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	" git plugin
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	" Ansible plugin
	Plug 'pearofducks/ansible-vim'
	" Auto pari quotes and brackets
	Plug 'jiangmiao/auto-pairs'
	" Auto completion
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'zchee/deoplete-clang', { 'for': ['c', 'cpp'] }
	Plug 'zchee/deoplete-jedi', { 'for': ['python'] }
	" Python code reference
	Plug 'davidhalter/jedi-vim', { 'for': ['python'] }
	" C++ Syntax Highlight
	Plug 'octol/vim-cpp-enhanced-highlight'
	" Tags
	Plug 'ludovicchabant/vim-gutentags', { 'for': ['c', 'cpp'] }
	Plug 'majutsushi/tagbar', { 'for': ['c', 'cpp'] }

	" Navigation
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

call plug#end()
