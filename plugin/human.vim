" vim: fileencoding=utf-8 tabstop=2 shiftwidth=2 foldlevel=0 foldmethod=marker:
" -----------------------------------------------------------------------------
" Name:     plugin/human.vim
" Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
" URL:      https://github.com/wuelnerdotexe/human.vim
" License:  Copyright (C) Wuelner Martínez.
" About:    Collection of vim default options for humans.
" -----------------------------------------------------------------------------
" Init: {{{

if &compatible || exists('g:loaded_human') | finish | endif

let g:loaded_human = 1

let s:nvim = has('nvim') ? 1 : 0

" }}}
" Options: {{{

" Because we are humans.
set nospell spelllang=en

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
if s:nvim || (!s:nvim && v:version > 703) | set formatoptions=tcjnp | endif

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
if s:nvim | set winbar=%t\ %m | endif

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

" Mappings.
set timeout
set ttimeout
set timeoutlen=568
set ttimeoutlen=42
set nolangremap

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

" Text editing.
set clipboard=unnamedplus
set backspace=indent,eol,start
set nostartofline
set whichwrap=<,>,h,l

" Performance.
set updatetime=42 ttyfast

" }}}
" Autocmds: {{{

" Better Vim jump to last cursor position with open fold support.
augroup vimStartup
  autocmd!
  autocmd BufReadPost *
        \ if &filetype !~# 'commit\|rebase'
        \ && line("'\"") >= 1
        \ && line("'\"") <= line("$") |
        \   execute 'normal! g`"' |
        \
        \   if foldclosed("'\"") != 1 | execute 'normal! zvzz' | endif |
        \ endif
augroup END

" Equalize splits if window got resized.
autocmd VimResized * tabdo wincmd =

" Update file on if changed somewhere else.
if !s:nvim
  autocmd FocusGained * silent! checktime
endif

" Highlight on yanked text.
if s:nvim
  " Create consistency highlight group for text yanked.
  highlight default TextYanked cterm=reverse gui=reverse

  " Highlight the yanked text for 125 milliseconds.
  autocmd TextYankPost * lua vim.highlight.on_yank({
        \   higroup='TextYanked', timeout=125
        \ })
endif

" }}}
" Keymaps: {{{

" Set <LocalLeader> to <underscore> for avoid clash with <Leader>.
if !exists("maplocalleader") | let maplocalleader = "|" | endif

" Remappings to conveniently navigate between word wrap.
nmap <expr> j (v:count == 0) ? 'gj' : 'j'
nmap <expr> k (v:count == 0) ? 'gk' : 'k'
vmap <expr> j (v:count == 0) ? 'gj' : 'j'
vmap <expr> k (v:count == 0) ? 'gk' : 'k'
map <expr> <Down> (v:count == 0) ? 'g<Down>' : '<Down>'
map <expr> <Up> (v:count == 0) ? 'g<Up>' : '<Up>'

" Add Neovim's default mappings to Vim because they make more sense.
if !s:nvim
	nnoremap Y y$
	nnoremap <C-L> <Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>
	inoremap <C-U> <C-G>u<C-U>
	inoremap <C-W> <C-G>u<C-W>
	xnoremap * y/\V<C-R>"<CR>
	xnoremap # y?\V<C-R>"<CR>
	nnoremap & :&&<CR>
endif

" More comfortable indentation.
vmap > >gv
vmap < <gv

" Buffer navigations.
nmap gb <Cmd>bnext<CR>
nmap gB <Cmd>bprev<CR>
nmap <S-PageDown> <Cmd>bnext<CR>
nmap <S-PageUp> <Cmd>bprev<CR>
imap <S-PageDown> <Cmd>bnext<CR>
imap <S-PageUp> <Cmd>bprev<CR>

" Toggle some options that are useful on-demand.
nmap _l <Cmd>setlocal cursorline! cursorline?<CR>
nmap _c <Cmd>setlocal cursorcolumn! cursorcolumn?<CR>
nmap _s <Cmd>setlocal spell! spell?<CR>
nmap _w <Cmd>setlocal wrap! wrap?<CR>

" }}}
