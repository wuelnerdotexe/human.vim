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
set spell spelllang=en
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
set wrap display=lastline
if s:nvim | set display+=msgsep | endif

" Help symbols.
set list listchars=trail:·,extends:>,precedes:< listchars+=tab:\ \ 

" Pair symbols.
set showmatch matchpairs=(:),{:},[:],<:>

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
set nonumber relativenumber numberwidth=4

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
let &laststatus = s:nvim ? 3 : 2
set showtabline=2

" Popups and Windows.
set pumwidth=14 pumheight=7 cmdwinheight=7

" Stabilize.
if has('nvim-0.9') ||
      \ (v:version >= 900 && has('patch667'))
  set splitkeep=screen
endif

" Terminal
if s:nvim
  autocmd TermOpen * call human#nofileOptions()
endif
" }}}
" Interaction and performance: {{{
" Disable Vim au last cursor position.
if !s:nvim
  augroup vimStartup
    execute 'au!'
  augroup END
endif

" Jump better to last cursor position.
autocmd BufReadPost *
      \ if &filetype !~# 'commit\|rebase'
      \ && line("'\"") > 1
      \ && line("'\"") <= line("$") |
      \   execute 'normal! g`"' |
      \ endif

" Automatically reload file if changed somewhere else
if !s:nvim
  redir => capture
    silent autocmd FocusGained
  redir END

  if match(capture, 'checktime') == -1
    autocmd FocusGained * silent! checktime
  endif
endif

" Mappings.
set ttimeout ttimeoutlen=40 nolangremap

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
  autocmd TextYankPost * silent! lua vim.highlight.on_yank({
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

" Text editing.
set clipboard=unnamed,unnamedplus
set backspace=indent,eol,start
set nostartofline
set whichwrap=<,>,h,l

" Performance.
set updatetime=40 ttyfast
" }}}
" -----------------------------------------------------------------------------
" SECTION: Mappings.
" -----------------------------------------------------------------------------
" Move previous/left with buffers.
nmap <silent> gB <Cmd>bprev<CR>
nmap <silent> <S-PageUp> <Cmd>bprev<CR>
imap <silent> <S-PageUp> <Cmd>bprev<CR>

" Move next/right with buffers.
nmap <silent> gb <Cmd>bnext<CR>
nmap <silent> <S-PageDown> <Cmd>bnext<CR>
imap <silent> <S-PageDown> <Cmd>bnext<CR>

" Use <C-l> to clear the highlighting of :set hlsearch.
if !s:nvim && maparg('<C-l>', 'n') ==# ''
  nnoremap <silent> <C-l>
        \ :nohlsearch<C-R>=has('diff') ? '<Bar>diffupdate' : ''<CR><CR><C-l>
endif

" Use <Esc> in the terminal to use normal Vim mode, not normal $SHELL mode.
tmap <expr> <Esc> (&filetype == 'fzf') ? '<Esc>' : '<c-\><c-n>'

" Better indenting.
vmap <silent> < <gv
vmap <silent> > >gv

" Remap for dealing with word wrap.
nmap <expr><silent> k (v:count == 0) ? 'gk' : 'k'
vmap <expr><silent> k (v:count == 0) ? 'gk' : 'k'
nmap <expr><silent> j (v:count == 0) ? 'gj' : 'j'
vmap <expr><silent> j (v:count == 0) ? 'gj' : 'j'
map <expr><silent> <Up> (v:count == 0) ? 'g<Up>' : '<Up>'
map <expr><silent> <Down> (v:count == 0) ? 'g<Down>' : '<Down>'
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

