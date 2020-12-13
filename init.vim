call plug#begin('~/.local/share/nvim/plugged')

	"Plug 'davidhalter/jedi-vim'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	"Plug 'zchee/deoplete-jedi'

	" rainbow brackets
	Plug 'frazrepo/vim-rainbow'

	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	let g:airline_theme='base16'

	" Plug 'jiangmiao/auto-pairs'

	Plug 'rainglow/vim'

	Plug 'scrooloose/nerdcommenter'

	Plug 'sbdchd/neoformat'

	Plug 'scrooloose/nerdtree'

	Plug 'neomake/neomake'

	"Plug 'davidhalter/jedi-vim'	
	"let g:jedi#completions_enabled = 0

	Plug 'joshdick/onedark.vim'

	Plug 'sheerun/vim-polyglot'
	Plug 'tpope/vim-surround'
call plug#end()	

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" autocomplete
let g:deoplete#enable_at_startup = 1

" python autoformat
let g:neoformat_python_autopep8 = {'exe': 'autopep8'}
let g:neoformat_python_black = {
    \ 'exe': 'black',
    \ 'stdin': 1,
    \ 'args': ['--line-length', '120', '-q', '-'],
    \ }
let g:neoformat_enabled_python = ['black']

"let g:neoformat_rust_rustfmt = {'exe': 'rustfmt'}
"let g:neoformat_enabled_rust = ['rustfmt']

"format on save
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

set hidden
set autoindent
set ignorecase
set encoding=utf-8

" position of cursor in bottom right
set ruler

" enable mouse
set mouse=a
set title

" disable legacy features
set nocompatible
set backspace=indent,eol,start
set tabstop=4

" lightline
set laststatus=2
if !has('gui_running')
		set t_Co=256
endif


set termguicolors
set textwidth=0
set wrapmargin=0
set wrap
set linebreak

"highlight Visual cterm=bold ctermbg=Blue ctermfg=NONE
set background=dark
syntax on
set guifont=Fira\ Code:h12
colorscheme storm-contrast

" relative number in normal mode, absolute number when not focused or insert
" mode
set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

set linespace=3

"rainbow brackets
let g:rainbow_active = 1

filetype plugin on
let g:NERDCreateDefaultMappings = 1

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown


""" nerd tree
" Shortcut ctrl-n
map <C-n> :NERDTreeToggle<CR>

" open tree if vim opened without files specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open tree if opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Close vim if the only window is a tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" highlighting
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

