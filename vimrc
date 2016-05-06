filetype on "File type 
filetype plugin on
set mouse=a  " Enable mouse
set nocompatible " disable VI mode

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
" tagbar
Plugin 'majutsushi/tagbar'
" multiple cursors
Plugin 'terryma/vim-multiple-cursors'
" Fuzzy file buffer
Plugin 'kien/ctrlp.vim'
" hybrid line number mode
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
" color theme
Plugin 'NLKNguyen/papercolor-theme'
" language highlighting 
Plugin 'magic-dot-files/TagHighlight'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-go'
Plugin 'plasticboy/vim-markdown'
" syntastic
Plugin 'scrooloose/syntastic'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'jwalton512/vim-blade'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
Plugin 'pangloss/vim-javascript', {'branch': 'develop'}
Plugin 'marijnh/tern_for_vim', {'do': 'npm install'}
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'heavenshell/vim-jsdoc', {'for': ['javascript', 'jsx']}
Plugin 'mxw/vim-jsx'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-commentary'

" snips
Plugin 'SirVer/ultisnips'

" visually select
Plugin 'terryma/vim-expand-region'

" tmux navigator
Plugin 'christoomey/vim-tmux-navigator'

" close tags
Plugin 'vim-scripts/AutoClose'
Plugin 'tpope/vim-surround'

call vundle#end()            " required
filetype plugin indent on    " required

" set for macvim
set guifont=Source\ Code\ Pro\ for\ Powerline:h16          " set fonts
set linespace=18                                           " set line height
set guioptions-=T
set guioptions-=r

" set leader
let mapleader = ' ' 

" status bar
set laststatus=1

set relativenumber           " 开启相对行
set nu!                      " 显示行号
set ruler                    " 右下角显示光标位置的状态行
set incsearch                " 开启实时搜索功
set hlsearch                 " 开启高亮显示结
set ignorecase               " ignore letter
set hidden                   " 允许在有未保存的修改时切换缓冲区
set autochdir                " 设定文件浏览器目录为当前目录
set fdm=syntax
set foldenable               " 启用折叠
set foldmethod=indent        " indent 折叠方式
set foldlevel=100            " 禁止自动折叠"

" set charset 
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
set fileformat=unix
set fileformats=unix,mac,dos

" Color Settings 
set t_Co=256
set background=dark
syntax on " open syntax highlight 
color PaperColor 
set cursorline 

" set autowrite
set conceallevel=0
set autowriteall
set backspace=2              " 设置退格键可用
set autoindent               " 自动对齐
set ai!                      " 设置自动缩进
set smartindent              " 智能自动缩进
set tabstop=4                " tab显示为4个空格
set shiftwidth=4             " 使用4个空格的缩进

" NERDTree
map <F2> :NERDTreeToggle<CR>
imap <F2> <ESC> :NERDTreeToggle<CR>

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F3> :TagbarToggle<CR>

" CtrlP (new fuzzy finder)
let g:ctvxzlp_custom_ignore = 'DS_Store\|git'
nmap <leader>p :CtrlP<CR>
nmap <leader>r :CtrlPBufTag<CR>
nmap <leader>e :CtrlPMRUFiles<CR>

" JSX Settings 
let g:jsx_pragma_required = 1 
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint'] " use eslint

" tablength exception
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

" php documentor 
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <leader>dc :call pdv#DocumentWithSnip()<CR>

" visually select
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
