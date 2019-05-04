" init package manager
execute pathogen#infect()

" colours
set background=dark
colorscheme iceberg

syntax on
set termguicolors

highlight Visual cterm=bold ctermbg=Blue ctermfg=NONE

set background=dark

" search highlighting & turn off with space bar
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" hide abandoned buffers rather than closing them
set hidden

" match indentation on new line
set autoindent

" ignore case in searches
set ignorecase

set smartcase

set encoding=utf-8

" show cursor positino in bottom right
set ruler

" mouse enabled in all modes
set mouse=a

set title

" vertical split for help
autocmd FileType help wincmd L

" Modernise
set nocompatible
set backspace=indent,eol,start

" 4 spaces to a tab
set tabstop=4
nnoremap <F5> :buffers<CR>:buffer<Space>
filetype plugin indent on

" lightline
set laststatus=2
if !has('gui_running')
	set t_Co=256
endif

" relative number in normal mode, absolute number when not focused or insert
" mode
set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" wrapping
set textwidth=0
set wrapmargin=0
set wrap
set linebreak
set columns=120

" add fuzzyfinder to runtime path
set rtp+=~/.fzf
