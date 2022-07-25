" vim: fileencoding=utf-8 tabstop=2 shiftwidth=2 foldlevel=0 foldmethod=marker:
" -----------------------------------------------------------------------------
" Name:     human.vim
" Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
" URL:      https://github.com/wuelnerdotexe/human.vim
" License:  MIT (C) Wuelner Martínez.
" About:    Collection of vim default options for humans.
" -----------------------------------------------------------------------------

if &compatible
  finish
endif

if !has('nvim')
  let skip_defaults_vim = 1
endif

" Because we are human.
set spell spelllang=en

" Files and backups: {{{
" File navigation.
set noautochdir

" File backups.
set nofsync
set noswapfile
set noundofile
set nowritebackup
set nobackup

" File auto-read.
set autoread

" Buffer fixes.
set hidden

" Session fixes.
set sessionoptions-=options

" View fixes.
set viewoptions-=options
" }}}
" Code display: {{{
" Syntax.
set synmaxcol=220

" Character encoding.
set encoding=utf-8

" Concealing.
set concealcursor=c conceallevel=2

" Indentation.
set autoindent shiftround breakindent

" Wrapping.
set nowrap
set display=lastline
if has('nvim')
  set display+=msgsep
endif

" Help symbols.
set list listchars=trail:-,extends:>,precedes:<

" Pair symbols.
set showmatch matchpairs=(:),{:},[:],<:>

" Enable emojis.
set emoji

" Formatting.
set nojoinspaces
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions=tcjnp
endif
" }}}
" User interface: {{{
" Titlebar.
set title
if has('nvim')
  set titlestring=Neovim\ for\ Humans
else
  set titlestring=Vim\ for\ Humans
endif

" Colors.
set t_Co=256 termguicolors background=dark

" Signcolumn display.
if has('nvim')
  set signcolumn=yes:1
else
  set signcolumn=yes
endif

" Line numbers.
set nonumber relativenumber numberwidth=2

" Lines position.
set cursorline nocursorcolumn

" Last line.
set history=50
set cmdheight=1
set showcmd
set showmode
set ruler
set confirm
set shortmess=mrxoOtTIF

" Wildmenu.
set wildmenu
set wildoptions=pum,tagfile
set nofileignorecase
set wildignore+=**/.git,**/.svn,**/.hg,**/CVS,**/.DS_store
set wildignore+=**/node_modules,**/bower_components,**/.vscode
set wildignorecase

" Status & tabline.
set laststatus=2 showtabline=2

" Popups and Windows.
set pumwidth=15 pumheight=15 cmdwinheight=15

" Terminal
if has('nvim')
  autocmd TermOpen * setl scl=no nospell nornu noru nocul cc= lcs-=trail
else
  autocmd TerminalOpen * setl scl=no nospell nornu noru nocul cc= lcs-=trail
endif
" }}}
" Interaction and performance: {{{
" Mappings.
set ttimeout
set ttimeoutlen=50
if has('langmap') && exists('+langremap')
  set nolangremap
endif

" Autocomplete.
set completeopt=menuone,noselect

" Live commands.
if has('nvim')
  set inccommand=nosplit
endif

" Searching.
set hlsearch
if has('reltime')
  set incsearch
endif
set ignorecase
set nosmartcase

" Yanked text.
if has('nvim')
  " Highlight text copied to clipboard (yanked) for 1 second.
  autocmd TextYankPost * silent! lua vim.highlight.on_yank {timeout=1000}
endif

" Mouse.
if has('mouse')
  if &term =~ 'xterm'
    set mouse=a
  else
    set mouse=nvi
  endif
endif

" Scrolling (set to 3 for consistency).
set scroll=0
set scrolloff=3
set scrolljump=0
set sidescroll=1
set sidescrolloff=4
if has('nvim')
  set mousescroll=ver:3,hor:4
endif

" Splits.
set nowinfixheight
set nowinfixwidth
set splitright
set splitbelow
set equalalways
set eadirection=both

" Text editing.
set clipboard+=unnamedplus backspace=indent,eol,start nostartofline

" Performance.
if !has('nvim')
  set updatetime=100
endif
set redrawtime=1500
set nolazyredraw
set ttyfast
" }}}
" -----------------------------------------------------------------------------
" SECTION: Mappings.
" -----------------------------------------------------------------------------
" Move previous/left with buffers.
nnoremap <silent> gB <Cmd>bprev<CR>
nnoremap <silent> <S-PageUp> <Cmd>bprev<CR>
inoremap <silent> <S-PageUp> <Cmd>bprev<CR>

" Move next/right with buffers.
nnoremap <silent> gb <Cmd>bnext<CR>
nnoremap <silent> <S-PageDown> <Cmd>bnext<CR>
inoremap <silent> <S-PageDown> <Cmd>bnext<CR>

" Use <C-L> to clear the highlighting of :set hlsearch.
if !has('nvim') && maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Use <Esc> in the terminal to use normal Vim mode, not normal $SHELL mode.
tnoremap <Esc> <C-\><C-n>
" -----------------------------------------------------------------------------
" SECTION: Plugins.
" -----------------------------------------------------------------------------
" Maximizer.vim: {{{
" The command for Maximizer is created.
command -nargs=0 MaximizerToggle call human#maximizer#toggle()

" Mappings are created to assign them to the command.
noremap <Plug>(MaximizerToggle) <Cmd>MaximizerToggle<CR>
noremap! <Plug>(MaximizerToggle) <Cmd>MaximizerToggle<CR>

" When changing windows, it restores if it has been maximized.
autocmd WinLeave * call human#maximizer#restore()
" }}}
