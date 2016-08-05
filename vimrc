filetype on "File type
filetype plugin on
set mouse=a  " Enable mouse
set nocompatible " disable VI mode
set textwidth=120 "set textwidth

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
" Bundle 'Valloric/YouCompleteMe'
Plugin 'Shougo/neocomplete.vim'
" tagbar
Plugin 'majutsushi/tagbar'
" multiple cursors
Plugin 'terryma/vim-multiple-cursors'
" Fuzzy file buffer
Plugin 'ctrlpvim/ctrlp.vim'
" hybrid line number mode
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
" color theme
Plugin 'hermanzhu/dotrc'
Plugin 'gosukiwi/vim-atom-dark'
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

" fast fold
Plugin 'Konfekt/FastFold'

" snips
Plugin 'SirVer/ultisnips'

" visually select
Plugin 'terryma/vim-expand-region'

" tmux navigator
Plugin 'christoomey/vim-tmux-navigator'

" close tags
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'

" code cs
Plugin 'stephpy/vim-php-cs-fixer'

" php
Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'

" super tab
Plugin 'ervandew/supertab'

" comment plugin
Plugin 'scrooloose/nerdcommenter'

" git wrapper
Plugin 'tpope/vim-fugitive'

call vundle#end()            " required
filetype plugin indent on    " required

" set leader
let mapleader = ' '

" turn off bell and flash
set visualbell
set t_vb=

" status bar
set laststatus=1

" set relativenumber           " 开启相对行
" set nu!                      " 显示行号
set ruler                    " 右下角显示光标位置的状态行
set incsearch                " 开启实时搜索功
set hlsearch                 " 开启高亮显示结
set ignorecase               " ignore letter
set hidden                   " 允许在有未保存的修改时切换缓冲区
set autochdir                " 设定文件浏览器目录为当前目录

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
color atom-dark-256
" set cursorline

" set autowrite
set conceallevel=0
set autowriteall
set backspace=2              " 设置退格键可用
set tabstop=4                " tab显示为4个空格
set shiftwidth=4             " 使用4个空格的缩进
set expandtab

" NERDTree
map <F2> :NERDTreeToggle<CR>
imap <F2> <ESC> :NERDTreeToggle<CR>

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F3> :TagbarToggle<CR>

" CtrlP (new fuzzy finder)
let g:ctvxzlp_custom_ignore = 'DS_Store\|git'
let g:ctrlp_working_path_mode = 'ra' 
let g:ctrlp_show_hidden = 1
nmap <leader>f :CtrlP<CR>
nmap <leader>r :CtrlPBufTag<CR>
nmap <leader>e :CtrlPMRUFiles<CR>
nmap <leader>cf :ClearCtrlPCache\|:CtrlP<CR>

" location list
nmap <leader>ln :lne<CR>
nmap <leader>lp :lpr<CR>

" JSX Settings
let g:jsx_pragma_required = 1
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint'] " use eslint

" statusline
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)

" syntastic
let g:syntastic_loc_list_height = 3
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" php syntastic
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args='--standard=Symfony2'

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

" multiple cursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:snips_author="herman <i@imzsy.com>"

" php cs fix
let g:php_cs_fixer_path = "~/.composer/vendor/bin/php-cs-fixer"
let g:php_cs_fixer_level = "symfony"
let g:php_cs_fixer_config = "default"
let g:php_cs_fixer_php_path = "php"

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" hide line number
set foldcolumn=1                      " Add a left margin
highlight! link FoldColumn Normal     " Make it the background colour
nmap <leader>nn :set norelativenumber\|set nonumber<CR>
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l


" Load the current buffer in Chrome
nmap ,c :!open -a Google\ Chrome<cr>

" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//



" for gui
if has("gui_running")
    set t_CO=256	      							"Use 256 colors. This is useful for Terminal Vim.
    set macligatures                                "Set fira code font for macvim
    set guifont=Fira\ Code:h15						"Set the default font family and size.
    set linespace=17   						        "Macvim-specific line-height.

    set guioptions-=l                               "Disable Gui scrollbars.
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    
    hi User1 guifg=#eea040 guibg=#222222
    hi User2 guifg=#dd3333 guibg=#222222
    hi User3 guifg=#ff66ff guibg=#222222
    hi User4 guifg=#a0ee40 guibg=#222222
    hi User5 guifg=#eeee40 guibg=#222222
endif


"-------------Auto-Commands--------------"

"Automatically source the Vimrc file on save.

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
