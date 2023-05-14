" vim: fileencoding=utf-8 tabstop=2 shiftwidth=2 foldlevel=0 foldmethod=marker:
" -----------------------------------------------------------------------------
" Name:     plugin/human.vim
" Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
" URL:      https://github.com/wuelnerdotexe/human.vim
" License:  Copyright (C) Wuelner Martínez.
" About:    Collection of vim default options for humans.
" -----------------------------------------------------------------------------

" VI mode isn´t for humans jaja.
if &compatible | finish | endif

" Necessary variables are initialized.
let s:nvim = has('nvim') ? 1 : 0

" Because we are humans.
set nospell spelllang=en
" Files and backups: {{{
" File navigation.
set noautochdir

" File backups.
set nobackup
set nowritebackup
set noswapfile
set nofsync
set undofile
if !s:nvim | set undodir=~/.vim/undo// | endif

" File auto-read.
set autoread

" Buffer fixes.
set hidden

" Session fixes.
let &sessionoptions = 'blank,buffers,help,localoptions,'.
      \ 'winpos,winsize,folds,tabpages,curdir,terminal'

" View fixes.
set viewoptions=localoptions,folds,cursor,curdir
" }}}
" Code display: {{{
" Syntax.
set synmaxcol=200

" Character encoding.
set encoding=utf-8

" Concealing.
set concealcursor=c conceallevel=2

" Indentation.
set autoindent
set copyindent
set preserveindent
set shiftround
set breakindent

" Wrapping.
set nowrap display=lastline
if s:nvim | set display+=msgsep | endif

" Help symbols.
set list listchars=trail:·,extends:>,precedes:< listchars+=tab:\ \ 
set fillchars=eob:\ 

" Pair symbols.
set showmatch matchtime=4 matchpairs=(:),{:},[:],<:>

" Enable emojis.
set emoji

" Folding.
set foldlevelstart=99

" Formatting.
set nojoinspaces
if s:nvim || (!s:nvim && v:version > 703)
  set formatoptions=tcjnp
endif
" }}}
" User interface: {{{
" Titlebar.
set title
let &titlestring = s:nvim ? 'Neovim for Humans' : 'Vim for Humans'

" Colors.
if !s:nvim
  " Enable tmux support for undercurls.
  let &t_Cs = "\e[4:3m"
  let &t_Ce = "\e[4:0m"

  " Enable tmux support for underdoubles.
  let &t_Us = "\e[4:2m"
  let &t_ds = "\e[4:4m"
  let &t_Ds = "\e[4:5m"

  " Enable tmux support for 256 colors.
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set t_Co=256 termguicolors background=dark

" Signcolumn display.
let &signcolumn = s:nvim ? 'yes:1' : 'yes'

" Line numbers.
set number norelativenumber numberwidth=4

" Lines position.
set nocursorline nocursorcolumn

" Last line.
set history=50
set cmdheight=1
set showcmd
set showmode
set ruler
set confirm
set shortmess=mrxoOtTF

" Wildmenu.
set wildmenu
set wildoptions=pum,tagfile
let &wildignore = '**/.git,**/.svn,**/.hg,**/CVS,**/.DS_store,**/Thumbs.db,'.
      \ '**/node_modules,**/bower_components,**/*.code-search'
set wildignorecase
set nofileignorecase

" Status & tab line.
let &laststatus = s:nvim ? 0 : 2
set showtabline=1

" Winbar.
if s:nvim
  set winbar=%t\ %m
endif

" Popups and Windows.
set pumwidth=14 pumheight=7 cmdwinheight=7

" Stabilize.
if has('nvim-0.9') ||
      \ (v:version >= 900 && has('patch667'))
  set splitkeep=screen
endif

" Terminal.
if s:nvim
  autocmd TermOpen * call human#nofileOptions()
endif

" Menus.
if s:nvim
  aunmenu PopUp.How-to\ disable\ mouse
endif
" }}}
" Interaction and performance: {{{
" Jump better to last cursor position.
augroup vimStartup
  autocmd!
  autocmd BufReadPost *
        \ if &filetype !~# 'commit\|rebase'
        \ && line("'\"") > 1
        \ && line("'\"") <= line("$") |
        \   execute 'normal! g`"' |
        \
        \   if foldclosed("'\"") != 1 | execute 'normal! zvzz' | endif |
        \ endif
augroup END

" Automatically reload file if changed somewhere else.
if !s:nvim
  autocmd FocusGained * silent! checktime
endif

" Mappings.
set timeout
set ttimeout
set timeoutlen=568
set ttimeoutlen=42
set nolangremap

" Add close mappings to help and man filetypes.
autocmd FileType help,man nmap <buffer> q <Cmd>close<CR>

" Autocomplete.
set completeopt=menuone,noselect

" Live commands.
if s:nvim | set inccommand=nosplit | endif

" Searching.
set hlsearch
set incsearch
set nosmartcase
set ignorecase

" Grepping.
if executable('rg') == 1
  let &grepprg = 'rg -i -. -g="'.
        \   '!.git,!.svn,!.hg,!CSV,!.DS_Store,!Thumbs.db'.
        \   '!node_modules,!bower_components,!*.code-search'.
        \ '" --vimgrep'
endif

" Yanked text.
if s:nvim
  " Create highlight group for intuitive text yanked.
  highlight default TextYanked cterm=reverse gui=reverse

  " Highlight text yanked (copy) for 125 milliseconds.
  autocmd TextYankPost * lua vim.highlight.on_yank({
        \   higroup='TextYanked', timeout=125
        \ })
endif

" Mouse.
if s:nvim
  let &mouse = &term =~ 'xterm' ? 'a' : 'nvi'
  set mousescroll=ver:1,hor:1
endif

" Scrolling.
set scrolloff=3
set scrolljump=1
set sidescroll=1
set sidescrolloff=4
" Important: Set all to 3 lines/characters for consistency with
"            Vim native |pum| menu and integrated Resizer.vim plugin.

" Splits.
set winheight=7
set winwidth=7
set winminheight=7
set winminwidth=7
set nowinfixheight
set nowinfixwidth
set splitright
set splitbelow
set equalalways
set eadirection=both

" Resize splits if window got resized.
autocmd VimResized * tabdo wincmd =

" Text editing.
set clipboard=unnamedplus
set backspace=indent,eol,start
set nostartofline
set whichwrap=<,>,h,l

" Performance.
set updatetime=42 ttyfast
" }}}
" -----------------------------------------------------------------------------
" SECTION: Mappings.
" -----------------------------------------------------------------------------
" Set <LocalLeader> to <underscore> for avoid clash with <Leader>.
if !exists("maplocalleader") | let maplocalleader = "_" | endif

" Toggle some options that are useful on-demand.
nmap _l <Cmd>setlocal cursorline! cursorline?<CR>
nmap _c <Cmd>setlocal cursorcolumn! cursorcolumn?<CR>
nmap _s <Cmd>setlocal spell! spell?<CR>
nmap _w <Cmd>setlocal wrap! wrap?<CR>

" Add Neovim defaults mappings to Vim.
if !s:nvim
	nnoremap Y y$
	nnoremap <C-L> <Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>
	inoremap <C-U> <C-G>u<C-U>
	inoremap <C-W> <C-G>u<C-W>
	xnoremap * y/\V<C-R>"<CR>
	xnoremap # y?\V<C-R>"<CR>
	nnoremap & :&&<CR>
endif

" Move next/right with buffers.
nmap gb <Cmd>bnext<CR>
nmap <S-PageDown> <Cmd>bnext<CR>
imap <S-PageDown> <Cmd>bnext<CR>

" Move previous/left with buffers.
nmap gB <Cmd>bprev<CR>
nmap <S-PageUp> <Cmd>bprev<CR>
imap <S-PageUp> <Cmd>bprev<CR>

" Better indenting.
vmap > >gv
vmap < <gv

" Remap for dealing with word wrap.
map <expr> <Down> (v:count == 0) ? 'g<Down>' : '<Down>'
map <expr> <Up> (v:count == 0) ? 'g<Up>' : '<Up>'
nmap <expr> j (v:count == 0) ? 'gj' : 'j'
nmap <expr> k (v:count == 0) ? 'gk' : 'k'
vmap <expr> j (v:count == 0) ? 'gj' : 'j'
vmap <expr> k (v:count == 0) ? 'gk' : 'k'

" Use <Esc> in terminal mode for use normal Vim mode, not normal $SHELL mode.
tmap <expr> <Esc> (&filetype == 'fzf') ? '<Esc>' : '<c-\><c-n>'
" -----------------------------------------------------------------------------
" SECTION: Plugins.
" -----------------------------------------------------------------------------
" BufOnly.vim: {{{
" The command for BufOnly is created.
command BufOnly call human#bufonly#Run()

" Mapping is created to assign it to the command.
map <Plug>(BufOnly) <Cmd>BufOnly<CR>
" }}}
" Maximizer.vim: {{{
" The command for Maximizer is created.
command MaximizerToggle call human#maximizer#Toggle()

" Mappings are created to assign them to the command.
map <Plug>(MaximizerToggle) <Cmd>MaximizerToggle<CR>
" }}}
" Resizer.vim: {{{
" The commands for Resizer are created.
command ResizerLeft call human#resizer#Run('left')
command ResizerDown call human#resizer#Run('down')
command ResizerUp call human#resizer#Run('up')
command ResizerRight call human#resizer#Run('right')

" Mappings are created to assign them to the command.
map <Plug>(ResizerLeft) <Cmd>ResizerLeft<CR>
map <Plug>(ResizerDown) <Cmd>ResizerDown<CR>
map <Plug>(ResizerUp) <Cmd>ResizerUp<CR>
map <Plug>(ResizerRight) <Cmd>ResizerRight<CR>
" }}}

