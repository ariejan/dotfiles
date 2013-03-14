set nocompatible
set laststatus=2

" Load pathogen
call pathogen#infect()
" Load helptags
call pathogen#helptags()

if !empty($MY_RUBY_HOME)
  let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/rubysite_ruby/*'),"\n"),',')
endif

" Always work with utf-8
set encoding=utf-8

" Highlight the cursor line
" set cursorline
" set cursorcolumn

" Automatically update changes on getting focus
set autoread

" Keep a longer history
set history=100

" Make file/command completion useful
set wildmenu
set wildmode=list:longest
set wildignore+=tmp,.bundle,.sass-cache,.git,.svn,.hg

" Set 256 color support
set t_Co=256

" Syntax highlighting
syntax on
set showmatch "matchin braces
set background=dark
colorscheme smyck

" Replace Ruby 1.8 Hash syntax with 1.9 Hash syntax_
nmap <leader>rh :%s/\v:(\w+) \=\>/\1:/g<cr>_ 

" Font see dotfiles/data
set guifont=Menlo:h12

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

" Clear search highlight 
" nnoremap <esc> :noh<return><esc>

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

" Autocommands
if has('autocmd')
    " Remove trailing whitespace from various files
    autocmd BufWritePre,FileWritePre *.html,*.rb,*.php,*.xml,*.erb call StripTrailingWhitespace()

    " Use 2 spaces for tabs in ruby and associated langs
    autocmd Filetype coffee,ruby,yaml,rake,rb,ru setlocal ts=2 sw=2 expandtab
    autocmd BufNewFile,BufRead {*.rake,Gemfile,Guardfile,Capfile,Rakefile,Thorfile,config.ru} set ft=ruby
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
endif

" Set open new windows below/to the right
set sb
set spr

" Set a nice status line
set statusline=%t%=%m\ %y\ [%c,%l]

" Highlight anything in column > 80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Remap Esc to ii
imap ii <Esc>
