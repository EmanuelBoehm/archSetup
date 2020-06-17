call plug#begin('~/.config/nvim/autoload/plugged')
	Plug 'tpope/vim-surround'
	" let's you comment out blocks
	Plug 'scrooloose/nerdcommenter'
	" File explorer
	Plug 'scrooloose/nerdtree'
	"Statusbar
	Plug 'vim-airline/vim-airline'
	Plug 'enricobacis/vim-airline-clock'
	"""GIT
	"shows a git diff 
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	"doing stuff on multiple lines
	Plug 'mattn/emmet-vim'
	"colorscheme
	Plug 'morhetz/gruvbox'
	"closes  quotes
	Plug 'Raimondi/delimitMate'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

