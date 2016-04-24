" General "

filetype on "File type 
filetype plugin on


" JSX   Settings 
let g:jsx_ext_required = 0
let g:jsx_pragma_required = 1

" 设置文件编码和文件格
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
set fileformat=unix
set fileformats=unix,mac,dos
set nocompatible " disable VI mode

set relativenumber           " 开启相对行
set nu!                      " 显示行号
set ruler                    " 右下角显示光标位置的状态行
set incsearch                " 开启实时搜索功???
set hlsearch                 " 开启高亮显示结???
set ignorecase               " ignore letter
set nowrapscan               " 搜索到文件两端时不重新搜???
set nocompatible             " 关闭兼容模式
set hidden                   " 允许在有未保存的修改时切换缓冲区
set autochdir                " 设定文件浏览器目录为当前目录
set fdm=syntax
set foldenable               " 启用折叠
set foldmethod=indent        " indent 折叠方式
set foldlevel=100            " 禁止自动折叠

set mouse=a  " Enable mouse
set encoding=utf-8

" set autowrite
set conceallevel=0
set autowriteall
set backspace=2              " 设置退格键可用
set autoindent               " 自动对齐
set ai!                      " 设置自动缩进
set smartindent              " 智能自动缩进

" airline
" let g:airline_theme="murmur" 
" let g:airline_theme="jellybeans" 
let g:airline_theme="dracula" 
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
" color theme
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
" language highlighting 
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-go'
Plugin 'plasticboy/vim-markdown'
Plugin 'mxw/vim-jsx'
" syntastic
Plugin 'scrooloose/syntastic'

call vundle#end()            " required
filetype plugin indent on    " required



" Color Settings 
set t_Co=256
set background=dark
syntax on " open syntax highlight 
color dracula 
set cursorline 

" NERDTree
map <F2> :NERDTreeToggle<CR>
imap <F2> <ESC> :NERDTreeToggle<CR>
