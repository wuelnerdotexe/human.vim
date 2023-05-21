" vim: fileencoding=utf-8 tabstop=2 shiftwidth=2 foldlevel=0 foldmethod=marker:
" -----------------------------------------------------------------------------
" Name:     autoload/human.vim
" Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
" URL:      https://github.com/wuelnerdotexe/human.vim
" License:  Copyright (C) Wuelner Martínez.
" About:    Collection of vim default options for humans.
" -----------------------------------------------------------------------------

" Options for no file buffers.
function! human#nofileOptions() abort
  setlocal nospell
  setlocal noruler
  setlocal nonumber
  setlocal norelativenumber
  setlocal nocursorline
  setlocal colorcolumn=
  setlocal signcolumn=no
endfunction
