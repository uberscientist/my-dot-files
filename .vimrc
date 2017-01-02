set nocompatible
set nomodeline
set background=dark
set hidden
set wildmenu
set hlsearch
set ignorecase
set smartcase
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
set noswapfile

filetype off
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'gregsexton/MatchTag'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'L9'
Plugin 'FuzzyFinder'
call vundle#end()

filetype plugin indent on

"set 256 color terminal for colorschemes
set t_Co=256
colorscheme distinguished

"enable mouse
set mouse=a

"Search incrementally instead of waiting for enter
set incsearch

"Show line numbers
set number

" Column 80 marker
highlight OverLength ctermbg=red ctermfg=white guibg=#660000
match OverLength /\%81v.\+/

"Show (partial) command in status line
set showcmd
set autowrite

"Make tabs 2 spaces
set expandtab
set shiftwidth=2
set tabstop=2
set smartindent

" < and > will hit indentation levels
set shiftround

au BufRead,BufNewFile *.rs setfiletype rust
"au BufRead,BufNewFile *.ejs setfiletype javascript.html
au BufRead,BufNewFile *.mustache setfiletype mustache

set encoding=utf-8
"backspace over end of line, indent, and insertion start
set backspace=eol,indent,start 

"Auto-complete curly braces
inoremap ({<CR>  ({<CR>});<Esc>O
inoremap {<CR>  {<CR>}<Esc>O

"Leaderkey mappings
let mapleader = ","
"FuzzyFinder mappings
nnoremap <leader>r :FufRenewCache<cr>
nnoremap <leader>t :FufCoverageFile<cr>

"format options
"no auto-commenting/wrapping
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
