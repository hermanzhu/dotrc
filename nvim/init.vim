" install vim-plug first
" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" npm i -g neovim typescript

" mac 加速光标移动速度
" defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
" defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

" let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/anaconda3/bin/python'

set tabstop=4
set shiftwidth=4
set expandtab

" fzf
set  runtimepath+=/usr/local/opt/fzf

" performance
let loaded_matchparen=1 " Don't load matchit.vim (paren/bracket matching)
set noshowmatch         " Don't match parentheses/brackets
set nocursorline        " Don't paint cursor line
set nocursorcolumn      " Don't paint cursor column
set ttyfast
set lazyredraw          " Wait to redraw
set scrolljump=8        " Scroll 8 lines at a time at bottom/top
let html_no_rendering=1 " Don't render italic, bold, links in HTML

filetype on "File type
filetype plugin on
set mouse=a  " Enable mouse
set nocompatible " disable VI mode
set textwidth=120 "set textwidth
set completeopt=menu " disable scratch window
set fillchars+=vert:\  " set parting line none

" set space as leader key.
let mapleader = ' '

" if hidden is not set, TextEdit might fail.
set hidden

" turn off bell and flash
set visualbell

" Some servers have issues with backup files
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=1

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" set charset
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
set fileformat=unix

" use true color
if (has("termguicolors"))
  set termguicolors
endif

" do not show relative line number default
" set number relativenumber

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Load the current buffer in Chrome
nmap ,c :!open -a Google\ Chrome<cr>

" start --------------------- emacs move mode when insert
" insert mode
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <C-o>:call <SID>home()<CR>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>

" command line mode
"cmap <C-p> <Up>
"cmap <C-n> <Down>
cmap <C-b> <Left>
cmap <C-f> <Right>
cmap <C-a> <Home>
cmap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
" end ---------------------- emacs move mode when insert


" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" define coc extensions
let g:coc_global_extensions = [
  \ 'coc-explorer',
  \ 'coc-snippets',
  \ 'coc-git',
  \ 'coc-floaterm',
  \ 'coc-tag',
  \ 'coc-go',
  \ 'coc-phpls',
  \ 'coc-go',
  \ 'coc-python',
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-tslint-plugin',
  \ 'coc-json',
  \ 'coc-emmet',
  \ 'coc-pairs',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-yaml',
  \ 'coc-highlight',
  \ 'coc-angular'
  \]

call plug#begin()

" color theme
Plug 'hermanzhu/dotrc'
Plug 'itchyny/lightline.vim'

" git
Plug 'tpope/vim-fugitive'

" easymotion
Plug 'easymotion/vim-easymotion'

" multi cursors
Plug 'terryma/vim-multiple-cursors'

" fzf
Plug 'yuki-ycino/fzf-preview.vim'

" icon
Plug 'ryanoasis/vim-devicons'

" close tags
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'

" relative line numbers
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" laravel blade syntax
Plug 'jwalton512/vim-blade'

" typescript jsx syntax
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" dart
Plug 'dart-lang/dart-vim-plugin'

" typescript
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }

call plug#end()

colorscheme ThemerVim
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_status_lines = 1
let g:nord_uniform_diff_background = 1
let g:nord_underline = 1

" delete buff
noremap <leader>db :<C-U><C-R>=printf("bdelete")<CR><CR>

" line number
highlight! link FoldColumn Normal     " Make it the background colour
nmap <leader>nn :set norelativenumber\|set nonumber<CR>
nmap <leader>sn :set number relativenumber<CR>
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight SignColumn guibg=#1D1F21

" tsx jsx
let g:vim_jsx_pretty_colorful_config = 1

" coc
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" end coc
"
highlight clear SignColumn
" lightline
" git blame
function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 10 ? blame : ''
endfunction

noremap <leader>gb :Gblame<CR>

" explorer
let g:coc_explorer_global_presets = {
\   '.vim': {
\      'root-uri': '~/.config/nvim',
\   },
\   'floating': {
\      'position': 'floating',
\   },
\   'floatingLeftside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 50,
\   },
\   'floatingRightside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 50,
\   },
\   'simplify': {
\     'file.child.template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }
" Use preset argument to open it
nmap <space>fe :CocCommand explorer<CR>
nmap <space>ed :CocCommand explorer --preset .vim<CR>
nmap <space>ef :CocCommand explorer --preset floating<CR>

" List all presets
nmap <space>el :CocList explPresets

let g:lightline = {
      \ 'colorscheme': 'ThemerVimLightline',
      \ 'active': {
      \   'left': [ [ 'mode' ],
      \             [ 'gitbranch', 'filename', 'modified', 'method' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileencoding', 'filetype' ] ]
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'component': {
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'blame': 'LightlineGitBlame',
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ }
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle
call insert(s:palette.normal.right, s:palette.normal.left[1], 0)
" lightline end
"
" fzf
"
" Add fzf quit mapping
let g:fzf_preview_quit_map = 1

" Use floating window (for neovim)
let g:fzf_preview_use_floating_window = 1

" floating window size ratio
let g:fzf_preview_floating_window_rate = 0.8

" floating window winblend value
let g:fzf_preview_floating_window_winblend = 15

" Commands used for fzf preview.
" The file name selected by fzf becomes {}
" let g:fzf_preview_command = 'head -100 {-1}'                       " Not installed bat
let g:fzf_preview_command = 'bat --color=always --style=grid {-1}' " Installed bat

" g:fzf_binary_preview_command is executed if this command succeeds, and g:fzf_preview_command is executed if it fails
let g:fzf_preview_if_binary_command = '[[ "$(file --mime {})" =~ binary ]]'

" Commands used for binary file
let g:fzf_binary_preview_command = 'echo "{} is a binary file"'

" Commands used to get the file list from project
" let g:fzf_preview_filelist_command = 'git ls-files --exclude-standard'               " Not Installed ripgrep
let g:fzf_preview_filelist_command = 'rg --files --hidden --follow --no-messages -g \!"* *"' " Installed ripgrep

" Commands used to get the file list from git reposiroty
let g:fzf_preview_git_files_command = 'git ls-files --exclude-standard'

" Commands used to get the file list from current directory
let g:fzf_preview_directory_files_command = 'rg --files --hidden --follow --no-messages -g \!"* *"'

" Commands used to get the git status file list
let g:fzf_preview_git_status_command = "git status --short --untracked-files=all | awk '{if (substr($0,2,1) !~ / /) print $2}'"

" Commands used for git status preview.
let g:fzf_preview_git_status_preview_command =  "[[ $(git diff -- {-1}) != \"\" ]] && git diff --color=always -- {-1} || " .
\ "[[ $(git diff --cached -- {-1}) != \"\" ]] && git diff --cached --color=always -- {-1} || " .
\ g:fzf_preview_command

" Commands used for project grep
let g:fzf_preview_grep_cmd = 'rg --line-number --no-heading'

" Commands used for current file lines
"let g:fzf_preview_lines_command = 'cat'
let g:fzf_preview_lines_command = 'bat --color=always --style=grid --theme=ansi-dark --plain'

" Commands used for preview of the grep result
let g:fzf_preview_grep_preview_cmd = expand('<sfile>:h:h') . '/bin/preview_fzf_grep'

" Cache directory for mru and mrw
let g:fzf_preview_cache_directory = expand('~/.cache/vim/fzf_preview')

" Keyboard shortcuts while fzf preview is active
let g:fzf_preview_preview_key_bindings = 'ctrl-d:preview-page-down,ctrl-u:preview-page-up,?:toggle-preview'

" Specify the color of fzf
let g:fzf_preview_fzf_color_option = ''

" Set the processors when selecting an element with fzf
" Do not use with g:fzf_preview_*_key_map
let g:fzf_preview_custom_default_processors = {}
" For example, set split to ctrl-s
" let g:fzf_preview_custom_default_processors = fzf_preview#resource_processor#get_default_processors()
" call remove(g:fzf_preview_custom_default_processors, 'ctrl-x')
" let g:fzf_preview_custom_default_processors['ctrl-s'] = function('fzf_preview#resource_processor#split')

" Use as fzf preview-window option
let g:fzf_preview_fzf_preview_window_option = ''
" let g:fzf_preview_fzf_preview_window_option = 'up:30%'

" Command to be executed after file list creation
"let g:fzf_preview_filelist_postprocess_command = ''
" let g:fzf_preview_filelist_postprocess_command = 'xargs -d "\n" ls -U --color'      " Use dircolors
" let g:fzf_preview_filelist_postprocess_command = 'xargs -d "\n" exa --color=always' " Use exa
" on Mac
let g:fzf_preview_filelist_postprocess_command = 'gxargs -d "\n" exa --color=always' "use exa

" Use vim-devicons
let g:fzf_preview_use_dev_icons = 1

" devicons character width
let g:fzf_preview_dev_icon_prefix_length = 3
"
"
nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

nnoremap <leader><enter>       :<C-u>FzfPreviewProjectFiles<CR>
nnoremap <silent> [fzf-p]p     :<C-u>FzfPreviewFromResources project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>FzfPreviewGitStatus<CR>
nnoremap <silent> [fzf-p]b     :<C-u>FzfPreviewBuffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>FzfPreviewAllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>FzfPreviewFromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>FzfPreviewJumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>FzfPreviewChanges<CR>
nnoremap <silent> [fzf-p]/     :<C-u>FzfPreviewLines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>FzfPreviewLines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>FzfPreviewProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>FzfPreviewBufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>FzfPreviewQuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>FzfPreviewLocationList<CR>
" fzf end
