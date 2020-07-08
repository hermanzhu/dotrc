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

" language solid
Plug 'sheerun/vim-polyglot'

" git
Plug 'tpope/vim-fugitive'

" easymotion
Plug 'easymotion/vim-easymotion'

" multi cursors
Plug 'terryma/vim-multiple-cursors'

" leaderf
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" tcomment
Plug 'tomtom/tcomment_vim'

" icon
Plug 'ryanoasis/vim-devicons'

" close tags
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'

" relative line numbers
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" laravel blade syntax
Plug 'jwalton512/vim-blade'

" typescript jsx ssyntaxyntax
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

" toml
Plug 'cespare/vim-toml'

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

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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
" leaderf
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "Victor\ Mono" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
let g:Lf_PopupColorscheme = 'default'

let g:Lf_PopupPalette = {
            \  'dark': {
            \      'Lf_hl_popup_window': {
            \                'gui': 'NONE',
            \                'font': 'NONE',
            \                'guifg': '#ebdbb2',
            \                'guibg': '#23292D',
            \                'cterm': 'NONE',
            \                'ctermfg': '255',
            \                'ctermbg': '237'
            \              },
            \      'Lf_hl_cursorline': {
            \                'gui': 'NONE',
            \                'font': 'NONE',
            \                'guifg': '#FA7218',
            \                'guibg': '#0A0216',
            \                'cterm': 'NONE',
            \                'ctermfg': 'NONE',
            \                'ctermbg': 'NONE'
            \              },
            \      'Lf_hl_match': {
            \                'gui': 'bold',
            \                'font': 'NONE',
            \                'guifg': '#1CD814',
            \                'guibg': 'NONE',
            \                'cterm': 'bold',
            \                'ctermfg': '14',
            \                'ctermbg': 'NONE'
            \              },
            \      'Lf_hl_popup_inputText': {
            \                'gui': 'NONE',
            \                'font': 'NONE',
            \                'guifg': '#ebdbb2',
            \                'guibg': '#32302f',
            \                'cterm': 'NONE',
            \                'ctermfg': 'NONE',
            \                'ctermbg': 'NONE'
            \              },
            \      'Lf_hl_popup_blank': {
            \                'gui': 'NONE',
            \                'font': 'NONE',
            \                'guifg': 'NONE',
            \                'guibg': '#3c3836',
            \                'cterm': 'NONE',
            \                'ctermfg': 'NONE',
            \                'ctermbg': '239'
            \              },
            \      'Lf_hl_popup_cwd': {
            \                'gui': 'NONE',
            \                'font': 'NONE',
            \                'guifg': '#a89984',
            \                'guibg': '#3c3836',
            \                'cterm': 'NONE',
            \                'ctermfg': 'NONE',
            \                'ctermbg': 'NONE'
            \              },
            \      'Lf_hl_popup_total': {
            \                'gui': 'NONE',
            \                'font': 'NONE',
            \                'guifg': '#f0f0f0',
            \                'guibg': '#504945',
            \                'cterm': 'NONE',
            \                'ctermfg': 'NONE',
            \                'ctermbg': 'NONE'
            \              },
            \      'Lf_hl_popup_lineInfo': {
            \                'gui': 'NONE',
            \                'font': 'NONE',
            \                'guifg': '#f0f0f0',
            \                'guibg': '#3c3836',
            \                'cterm': 'NONE',
            \                'ctermfg': 'NONE',
            \                'ctermbg': 'NONE'
            \              },
            \      'Lf_hl_popup_normalMode': {
            \                'gui': 'bold',
            \                'font': 'NONE',
            \                'guibg': '#3C3836',
            \                'guifg': '#1299AD',
            \                'cterm': 'bold',
            \                'ctermfg': 'NONE',
            \                'ctermbg': 'NONE'
            \              },
            \      'Lf_hl_popup_inputMode': {
            \                'gui': 'bold',
            \                'font': 'NONE',
            \                'guibg': '#3C3836',
            \                'guifg': '#6EBB82',
            \                'cterm': 'bold',
            \                'ctermfg': 'NONE',
            \                'ctermbg': 'NONE'
            \              },
            \      'Lf_hl_popup_fullPathMode': {
            \                'gui': 'NONE',
            \                'font': 'NONE',
            \                'guifg': '#f0f0f0',
            \                'guibg': '#504945',
            \                'cterm': 'NONE',
            \                'ctermfg': 'NONE',
            \                'ctermbg': 'NONE'
            \              },
            \      'Lf_hl_popup_category': {
            \                'gui': 'NONE',
            \                'font': 'NONE',
            \                'guifg': '#f0f0f0',
            \                'guibg': '#504945',
            \                'cterm': 'NONE',
            \                'ctermfg': 'NONE',
            \                'ctermbg': 'NONE'
            \              },
            \      'Lf_hl_popup_fuzzyMode': {
            \                'gui': 'NONE',
            \                'font': 'NONE',
            \                'guifg': '#f0f0f0',
            \                'guibg': '#504945',
            \                'cterm': 'NONE',
            \                'ctermfg': 'NONE',
            \                'ctermbg': 'NONE'
            \              },
            \      'Lf_hl_popup_regexMode': {
            \                'gui': 'NONE',
            \                'font': 'NONE',
            \                'guifg': '#f0f0f0',
            \                'guibg': '#504945',
            \                'cterm': 'NONE',
            \                'ctermfg': 'NONE',
            \                'ctermbg': 'NONE'
            \              },
            \      'Lf_hl_popup_nameOnlyMode': {
            \                'gui': 'NONE',
            \                'font': 'NONE',
            \                'guifg': '#a89984',
            \                'guibg': '#504945',
            \                'cterm': 'NONE',
            \                'ctermfg': 'NONE',
            \                'ctermbg': 'NONE'
            \              },
            \      }
            \  }

" Leaderf-popupp
"highlight def link Lf_hl_popup_window Pmenu
"highlight def link Lf_hl_popup_cwd    Lf_hl_popup_category
"highlight def link Lf_hl_help         Comment
"highlight def link Lf_hl_helpCmd      Identifier
highlight CursorLine guibg=#23292D
highlight CursorLineNr guibg=#23292D
"highlight NormalNC guibg=#0A0216
highlight NormalFloat guibg=#002B36

let g:Lf_ShortcutF = "<leader><enter>"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>ff :<C-U><C-R>=printf("Leaderf function %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
" end leaderf
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
" golang
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1
