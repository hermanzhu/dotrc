" General "

filetype on "File type 
filetype plugin on

set nocompatible " disable VI mode
set nu "show line number
set relativenumber  " show relative line number
syntax on " open syntax highlight 
set mouse=a  " Enable mouse
set hlsearch " Highlight the search result
set incsearch " Real-time search
set ignorecase " ignore letter
set encoding=utf-8
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" airline
let g:airline_theme="luna" 
let g:airline_powerline_fonts = 1 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
set laststatus=2

" Vundle Config
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" NertTree Plugin
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Auto complete
Bundle 'Valloric/YouCompleteMe'
" newer powerline is https://github.com/powerline/powerline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chriskempson/tomorrow-theme' 
" tagbar
Plugin 'majutsushi/tagbar'
" multiple cursors
Plugin 'terryma/vim-multiple-cursors'
" Fuzzy file buffer
Plugin 'kien/ctrlp.vim'
" hybrid line number mode
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

call vundle#end()            " required
filetype plugin indent on    " required



"================"
" Color Settings "
"================"

set t_Co=256

try
    set background=dark
    colorscheme Tomorrow-Night-Bright
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry

" Highlight TODO/FIXME/XXX
highlight myTODO cterm=bold term=bold ctermbg=yellow ctermfg=black
match myTODO /\(TODO\|XXX\|FIXME\)/

set cursorline
hi search cterm=underline ctermfg=white
