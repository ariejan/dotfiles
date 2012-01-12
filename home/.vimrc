" Don't be Vi, be Vim!
set nocompatible

" Load pathogen
call pathogen#infect()
" Load helptags
call pathogen#helptags()

" Always work with utf-8
set encoding=utf-8

" Highlight the cursor line
set cursorline

" Automatically update changes on getting focus
set autoread

" Keep a longer history
set history=100

" Make file/command completion useful
set wildmenu
set wildmode=list:longest

" Syntax highlighting
syntax on
set showmatch "matchin braces
set background=dark

" Intuitive backspace
set bs=indent,eol,start

" Filetype detection
filetype plugin indent on

" Line wrapping
set nowrap
set linebreak

" Make sure we use editor lines, not real lines when navigating
nnoremap j gj
nnoremap k gk

" Some other settings
set hidden
set modelines=0

