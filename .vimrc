syntax on
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
set hidden
set autoindent
set ignorecase
set smartcase
set encoding=utf-8
set ruler
set mouse=a
set title
set background=dark
set nocompatible
set tabstop=4
nnoremap <F5> :buffers<CR>:buffer<Space>
filetype plugin indent on

" start pathogen
execute pathogen#infect()

" lightline
set laststatus=2
if !has('gui_running')
	set t_Co=256
endif
