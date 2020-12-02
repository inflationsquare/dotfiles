" init package manager
execute pathogen#infect()
"
" load vimrcs in working directory. For project specific config
set exrc
set secure

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

""" colours
set background=dark

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

" different cursors in different modes
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' |
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

" wrapping
set textwidth=0
set wrapmargin=0
set wrap
set linebreak

" colourscheme
set guifont=Fira\ Code:h12
" previously had iceberg
colorscheme rebellion-contrast

" Transparent background, doesn't work with blank files.
"hi Normal guibg=NONE ctermbg=NONE
"colorscheme juicy-contrast
