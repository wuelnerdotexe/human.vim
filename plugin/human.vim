" vim: fileencoding=utf-8 tabstop=2 shiftwidth=2 foldlevel=0 foldmethod=marker:
" -----------------------------------------------------------------------------
" Name:     human.vim
" Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
" URL:      https://github.com/wuelnerdotexe/human.vim
" License:  Copyright (C) Wuelner Martínez.
" About:    Collection of vim default options for humans.
" -----------------------------------------------------------------------------

" VI mode isn´t for humans jaja.
if &compatible | finish | endif

" Because we are humans.
set spell spelllang=en
" Files and backups: {{{
" File navigation.
set noautochdir

" File backups.
set nofsync
set noswapfile
set undofile
if !has('nvim') | set undodir=~/.vim/undo// | endif
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
if has('nvim') | set display+=msgsep | endif

" Help symbols.
set list listchars=trail:·,extends:>,precedes:< listchars+=tab:\ \ 

" Pair symbols.
set showmatch matchpairs=(:),{:},[:],<:>

" Enable emojis.
set emoji

" Formatting.
set nojoinspaces
if has('nvim')
  set formatoptions=tcjnp
elseif v:version > 703
  set formatoptions=tcjnp
endif

" Languages.
autocmd FileType css,scss,sass,less setlocal iskeyword+=$,-,@-@
autocmd FileType json setfiletype jsonc
autocmd BufNewFile,BufRead *.mdx setfiletype markdown.mdx
" }}}
" User interface: {{{
" Titlebar.
set title
let &titlestring = has('nvim') ? 'Neovim for Humans' : 'Vim for Humans'

" Colors.
if !has('nvim')
  " Enable termguicolors in Vim with tmux.
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  " [...] For Undercurls.
  let &t_Cs = "\e[4:3m"
  let &t_Ce = "\e[4:0m"
endif
set t_Co=256 termguicolors background=dark

" Signcolumn display.
let &signcolumn = has('nvim') ? 'yes:1' : 'yes'

" Line numbers.
set nonumber relativenumber numberwidth=2

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
set nofileignorecase
set wildignore=**/.git,**/.svn,**/.hg,**/CVS,**/.DS_store,**/Thumbs.db
set wildignore+=**/node_modules,**/bower_components,**/*.code-search
set wildignorecase

" Status & tab line.
let &laststatus = has('nvim') ? 3 : 2
set showtabline=2

" Popups and Windows.
set pumwidth=15 pumheight=7 cmdwinheight=7

" Stabilize.
if has('nvim')
lua <<EOF
  if vim.version().minor >= 9 and vim.fn.has('patch667') then
    vim.opt.splitkeep = 'screen'
  end
EOF
elseif v:version >= 900 && has('patch667')
  set splitkeep=screen
endif

" Terminal
if has('nvim')
  autocmd TermOpen *
        \ setlocal nospell noru nornu nonu nocul cc= scl=no |
        \ startinsert!
endif
" }}}
" Interaction and performance: {{{
" Disable Vim au last cursor position.
if !has('nvim')
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

" Mappings.
set ttimeout
set ttimeoutlen=40
set nolangremap

" Autocomplete.
set completeopt=menuone,noselect

" Live commands.
if has('nvim') | set inccommand=nosplit | endif

" Searching.
set hlsearch
set incsearch
set ignorecase nosmartcase

" Grepping.
if executable('rg') == 1
  let &grepprg = 'rg -i -. -g="'.
        \   '!.git,!.svn,!.hg,!CSV,!.DS_Store,!Thumbs.db'.
        \   '!node_modules,!bower_components,!*.code-search'.
        \ '" --vimgrep'
endif

" Yanked text.
if has('nvim')
  " Create highlight group for intuitive text yanked.
  highlight default TextYanked cterm=reverse gui=reverse

  " Highlight text yanked (copy) for 600 milliseconds.
  autocmd TextYankPost * silent! lua vim.highlight.on_yank({
        \   higroup='TextYanked', timeout=125
        \ })
endif

" Mouse.
if has('nvim') | let &mouse = &term =~ 'xterm' ? 'a' : 'nvi' | endif

" Scrolling.
set scroll=0
set scrolloff=3
set scrolljump=0
set sidescroll=1
set sidescrolloff=4
" Important: Set all to 3 lines/characters for consistency with
"            Vim native |pum| menu and integrated Resizer.vim plugin.

" Splits.
set nowinfixheight
set nowinfixwidth
set splitright
set splitbelow
set equalalways
set eadirection=both

" Text editing.
set clipboard+=unnamedplus
set backspace=indent,eol,start
set nostartofline
set whichwrap=<,>,h,l

" Performance.
set updatetime=40 lazyredraw ttyfast
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
if !has('nvim') && maparg('<C-l>', 'n') ==# ''
  nnoremap <silent> <C-l>
        \ :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-l>
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

