set nocompatible
filetype off

" Execute commands with Bash, always.
set shell=/bin/bash

" Load Vundle, store bundles in ~/.vundle.local
set rtp+=~/.vim/bundle/vundle/
call vundle#begin('~/.vundle.local')

" Let vundle manage vundle
Plugin 'gmarik/Vundle.vim'

" CtrlP
Plugin 'kien/ctrlp.vim'

" Bling
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Useful helpers
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'align'
Plugin 'tpope/vim-sleuth'

" Git / Fugitive
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

" Markdown
Plugin 'tpope/vim-markdown'

" TMux
Plugin 'christoomey/vim-tmux-navigator'

" Golang
Plugin 'fatih/vim-go'

" Ruby etc.
Plugin 'vim-ruby/vim-ruby'

" Pretty colours
Plugin 'ariejan/vim-monochrome'

" Elixir
Plugin 'elixir-lang/vim-elixir'

" Elm
Plugin 'lambdatoast/elm.vim'


" Done, finish up Vundle
call vundle#end()

let g:ruby_path = system('echo $HOME/.rbenv/shims')
filetype plugin indent on

" Map leader key
let mapleader=","

" To enable vim-airline directly
set laststatus=2

" Always work with utf-8
set encoding=utf-8

" Highlight the cursor line
set cursorline
" set cursorcolumn

" Automatically update changes on getting focus
set autoread

" Keep a longer history
set history=100

" Realtime git update
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

" Make file/command completion useful
set wildmenu
set wildmode=list:longest
set wildignore+=tmp,.bundle,.sass-cache,.git,.svn,.hg

set lazyredraw  

" Disable audible bell
set visualbell

" Syntax highlighting
syntax on
set showmatch "matchin braces

" colorscheme 
colorscheme monochrome
let g:airline_theme='monochrome'

" Replace Ruby 1.8 Hash syntax with 1.9 Hash syntax_
nmap <leader>rh :%s/\v:(\w+) \=\>/\1:/g<cr>_ 

" Font see dotfiles/data
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12

" Intuitive backspace
set bs=indent,eol,start

" Line wrapping
set nowrap
set linebreak

" Make sure we use editor lines, not real lines when navigating
nnoremap j gj
nnoremap k gk

" Rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Some other settings
set hidden
set modelines=0

" Status line
set showcmd
set ruler
set number

" Scrollbars
set sidescrolloff=2
set numberwidth=4

" Maintain more context around the cursor
set scrolloff=3

" Don't keep backups
set nobackup
set nowritebackup
set noswapfile

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <leader><space> :noh<CR>

" Set terminal title
set title

" Indenting
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set ai " Automatically set the indent of a new line
set si " Smart indent

" Remove trailing whitespace from code files on save
function! StripTrailingWhitespace()
  " store current cursor location
  silent exe "normal ma<CR>"
  " store the current search value
  let saved_search = @/

  " delete the whitespace (e means don't warn if pattern not found)
  %s/\s\+$//e

  " restore old cursor location
  silent exe "normal `a<CR>"
  " restore the search value
  let @/ = saved_search
endfunction

" Set open new windows below/to the right
set sb
set spr

" Set a nice status line
set statusline=%t%=%m\ %y\ [%c,%l]

" Highlight anything in column > 80
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

" Remap Esc to ii
" imap ii <Esc>

" Airline
let g:airline_powerline_fonts=0

" Easy pasting, ripped from tpope/vim-unimpaired
function! s:setup_paste() abort
  let s:paste = &paste
  let s:mouse = &mouse
  set paste
  set mouse=
endfunction

nnoremap <silent> <Plug>unimpairedPaste :call <SID>setup_paste()<CR>

nnoremap <silent> yp  :call <SID>setup_paste()<CR>a
nnoremap <silent> yP  :call <SID>setup_paste()<CR>i
nnoremap <silent> yo  :call <SID>setup_paste()<CR>o
nnoremap <silent> yO  :call <SID>setup_paste()<CR>O
nnoremap <silent> yA  :call <SID>setup_paste()<CR>A
nnoremap <silent> yI  :call <SID>setup_paste()<CR>I
nnoremap <silent> ygi :call <SID>setup_paste()<CR>gi
nnoremap <silent> ygI :call <SID>setup_paste()<CR>gI

" Autocommands
if has('autocmd')
    augroup autocommandbots
        autocmd!
        " Remove trailing whitespace from various files
        autocmd BufWritePre,FileWritePre *.html,*.rb,*.php,*.xml,*.erb call StripTrailingWhitespace()

        " Use 2 spaces for tabs in ruby and associated langs
        autocmd Filetype coffee,ruby,yaml,rake,rb,ru,javascript setlocal ts=2 sw=2 expandtab
        autocmd BufNewFile,BufRead {*.rake,Podfile,Gemfile,Guardfile,Capfile,Rakefile,Thorfile,config.ru} set ft=ruby
        autocmd BufNewFile,BufRead Gemfile.lock set ft=yaml
        autocmd BufNewFile,BufRead *.json set ft=javascript
        autocmd BufNewFile,BufRead *.prawn set ft=ruby
        autocmd BufNewFile,BufRead *.go set ft=go

        " Enable Less syntax
        autocmd BufRead,BufNewFile *.less set filetype=less

        " Enable SCSS syntax
        autocmd BufRead,BufNewFile *.scss set filetype=scss

        " Enable soft-wrapping for text files
        autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

        " Auto-resise windows when resizing
        autocmd VimResized * wincmd =

        " Folding on indent for HAML and coffee-script files
        autocmd BufNewFile,BufReadPost *.{coffee,haml} setl foldmethod=indent nofoldenable

        " Unimpaired paste
        autocmd InsertLeave *
            \ if exists('s:paste') |
            \   let &paste = s:paste |
            \   let &mouse = s:mouse |
            \   unlet s:paste |
            \   unlet s:mouse |
            \ endif
    augroup END
endif


" Mark the 79-character limit
" let &colorcolumn=join(range(80,999),",")
" highlight ColorColumn ctermbg=235 guibg=#2c2d27

" Configure vim-go
let g:go_fmt_command = "goimports"

" Configure gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_post_private = 1
let g:gist_open_browser_after_post = 1

" Explore
map <leader>f :Explore<cr>
let g:netrw_liststyle=3

" Set short timeout, helps with vim-airline switching from INSERT mode
set ttimeoutlen=10
