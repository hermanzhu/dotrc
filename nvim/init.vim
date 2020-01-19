" install vim-plug first
" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" npm i -g neovim typescript

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

" show relative line number default.
set number relativenumber

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Load the current buffer in Chrome
nmap ,c :!open -a Microsoft\ Edge<cr>

" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" define coc extensions
let g:coc_global_extensions = [
  \ 'coc-explorer',
  \ 'coc-ultisnips',
  \ 'coc-git',
  \ 'coc-phpls',
  \ 'coc-python',
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-tslint-plugin',
  \ 'coc-json',
  \ 'coc-emmet',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-yaml',
  \ 'coc-highlight',
  \ 'coc-angular'
  \]

call plug#begin()

" color theme
" Plug 'hermanzhu/dotrc'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'

" git
Plug 'tpope/vim-fugitive'

" easymotion
Plug 'easymotion/vim-easymotion'

" leaderf
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

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
Plug 'peitalin/vim-jsx-typescript'

" tags
Plug 'majutsushi/tagbar'
" {{{
  nnoremap <silent> <F4> :TagbarToggle<CR>
" }}}

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" dart
Plug 'dart-lang/dart-vim-plugin'

" typescript
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }

call plug#end()

colorscheme nord
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_status_lines = 1
let g:nord_uniform_diff_background = 1
let g:nord_underline = 1

set guifont=FuraCode\ Nerd\ Font:h15

" line number
highlight! link FoldColumn Normal     " Make it the background colour
nmap <leader>nn :set norelativenumber\|set nonumber<CR>
nmap <leader>sn :set number relativenumber<CR>
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight SignColumn guibg=#1D1F21

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
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "FuraCode\ Nerd\ Font" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
" let g:Lf_PopupColorscheme = 'default'
" Leaderf-popupp
highlight def link Lf_hl_popup_window Pmenu
highlight def link Lf_hl_popup_cwd    Lf_hl_popup_category
highlight def link Lf_hl_help         Comment
highlight def link Lf_hl_helpCmd      Identifier

highlight def Lf_hl_popup_cursor       guifg=#14212b guibg=#5E81AC gui=NONE
highlight def Lf_hl_popup_inputText    guifg=#ecebf0 guibg=#34323E gui=bold
highlight def Lf_hl_popup_blank        guifg=NONE    guibg=#34323E gui=NONE
highlight def Lf_hl_popup_prompt       guifg=#5E81AC guibg=NONE    gui=bold
highlight def Lf_hl_popup_lineInfo     guifg=#353129 guibg=#dce6da gui=bold
highlight def Lf_hl_popup_total        guifg=#f2ebc7 guibg=#6e7476 gui=bold
highlight def Lf_hl_popup_spin         guifg=#e6e666 guibg=NONE    gui=NONE
highlight def Lf_hl_popup_normalMode   guifg=#333300 guibg=#99C27C gui=bold
highlight def Lf_hl_popup_inputMode    guifg=#003333 guibg=#65B0ED gui=bold
highlight def Lf_hl_popup_nameOnlyMode guifg=#14212b guibg=#5E81AC gui=bold
highlight def Lf_hl_popup_fullPathMode guifg=#14212b guibg=#5E81AC gui=bold
highlight def Lf_hl_popup_fuzzyMode    guifg=#14212b guibg=#5E81AC gui=bold
highlight def Lf_hl_popup_regexMode    guifg=#14212b guibg=#e6e666 gui=bold
highlight def Lf_hl_popup_category     guifg=#f2ebc7 guibg=#6e7476 gui=bold

highlight def Lf_hl_match       guifg=#88C0D0 guibg=NONE    gui=bold
highlight def Lf_hl_match0      guifg=#88C0D0 guibg=NONE    gui=bold
highlight def Lf_hl_match1      guifg=#43b9f0 guibg=NONE    gui=bold
highlight def Lf_hl_match2      guifg=#e6e666 guibg=NONE    gui=bold
highlight def Lf_hl_match3      guifg=#3ff5d1 guibg=NONE    gui=bold
highlight def Lf_hl_match4      guifg=#FF0000 guibg=NONE    gui=bold
highlight def Lf_hl_matchRefine guifg=Magenta guibg=NONE    gui=bold
highlight def Lf_hl_cursorline  guifg=#5E81AC guibg=#212026 gui=bold
highlight def Lf_hl_selection   guifg=Black   guibg=#a5eb84 gui=NONE

let g:Lf_ShortcutF = "<leader><enter>"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
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
  return winwidth(0) > 120 ? blame : ''
endfunction

" explorer
nmap ge :CocCommand explorer
    \ --toggle
    \ --sources=buffer+,file+
    \ --file-columns=selection:clip:indent:icon:filename;fullpath;size;modified;readonly <CR>

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'helloworld' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'blame', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component': {
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'blame': 'LightlineGitBlame'
      \ },
      \ }
" lightline end
