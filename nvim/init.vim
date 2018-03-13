" install vim-plug first
" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

filetype on "File type
filetype plugin on
set mouse=a  " Enable mouse
set nocompatible " disable VI mode
set textwidth=120 "set textwidth
set completeopt=menu " disable scratch window
set fillchars+=vert:\  " set parting line none

" set space as leader key.
let mapleader = ' '

" turn off bell and flash
set visualbell

" set charset
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
set fileformat=unix

" use true color
set termguicolors

" show relative line number default.
set number relativenumber


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

" statusline default hidden.
set laststatus=0
set statusline=
"set statusline+=%7*\[%n]                                 " buffernr
set statusline+=%1*\ %<%F\                                " File+path
"set statusline+=%2*\ %y\                                 " FileType
"set statusline+=%{ALEGetStatusLine()}
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%8*\ %=\ row:%l/%L\ (%2p%%)\             "Rownumber/total (%)


call plug#begin()

" NertTree Plugin
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" {{{
  let g:nerdtree_tabs_open_on_console_startup=0
  let g:NERDTreeDirArrowExpandable = '▸'
  let g:NERDTreeDirArrowCollapsible = '▾'
" }}}

" color theme
Plug 'hermanzhu/dotrc'

" easymotion
Plug 'easymotion/vim-easymotion'


" close tags
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'

" file icons
Plug 'ryanoasis/vim-devicons'

" relative line numbers
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" tags
Plug 'majutsushi/tagbar'
" {{{
  nnoremap <silent> <F4> :TagbarToggle<CR>
" }}}

" fuzzy find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" {{{
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting

  nnoremap <silent> <leader><enter> :Files<CR>
  nnoremap <silent> <leader>a :Buffers<CR>
  nnoremap <silent> <leader>A :Windows<CR>
  nnoremap <silent> <leader>; :BLines<CR>
  nnoremap <silent> <leader>o :BTags<CR>
  nnoremap <silent> <leader>O :Tags<CR>
  nnoremap <silent> <leader>? :History<CR>
  nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
  nnoremap <silent> <leader>. :AgIn 

  nnoremap <silent> K :call SearchWordWithAg()<CR>
  vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
  nnoremap <silent> <leader>gl :Commits<CR>
  nnoremap <silent> <leader>ga :BCommits<CR>
  nnoremap <silent> <leader>ft :Filetypes<CR>

  imap <C-x><C-f> <plug>(fzf-complete-file-ag)
  imap <C-x><C-l> <plug>(fzf-complete-line)

  function! SearchWordWithAg()
    execute 'Ag' expand('<cword>')
  endfunction

  function! SearchVisualSelectionWithAg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ag' selection
  endfunction

  function! SearchWithAgInDirectory(...)
    call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
  endfunction
  command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)
" }}}

" language support
Plug 'leafgarland/typescript-vim'

" nvim completion manager
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'roxma/nvim-completion-manager'

" php auto complete
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
" {{{
" }}}

Plug 'mhartington/nvim-typescript'


" {{{
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  "let g:LanguageClient_serverCommands = {
  "  \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
  "  \ 'javascript': ['javascript-typescript-stdio'],
  "  \ 'javascript.jsx': ['javascript-typescript-stdio'],
  "  \ }
" }}}

" comment
Plug 'scrooloose/nerdcommenter'


call plug#end()

colorscheme smyck
set guifont=FuraCode\ Nerd\ Font:h15


" NERDTree config
map <F2> :NERDTreeToggle<CR>
imap <F1> <ESC> :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git','\~$','\.swp']
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let g:NERDTreeDirArrowExpandable = "+"
let g:NERDTreeDirArrowCollapsible = "~"
set ambiwidth=double

" dev icons
autocmd FileType nerdtree setlocal nolist
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_ctrlp = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" line number
highlight! link FoldColumn Normal     " Make it the background colour
nmap <leader>nn :set norelativenumber\|set nonumber<CR>
nmap <leader>rn :set number relativenumber<CR>
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight SignColumn guibg=#1D1F21

" fzf
