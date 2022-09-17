" vim: fileencoding=utf-8 tabstop=2 shiftwidth=2 foldlevel=0 foldmethod=marker:
" -----------------------------------------------------------------------------
" Name:     maximizer.vim
" Author:   Szymon Wrozynski <https://github.com/szw/vim-maximizer>
" URL:      https://github.com/wuelnerdotexe/human.vim
" License:  Copyright (c) 2012-2015 Szymon Wrozynski and Contributors.
" About:    Maximizes and restores the current window.
" -----------------------------------------------------------------------------

function! s:Enable() abort
  let t:maximizer_sizes = { 'before': winrestcmd() }

  resize
  vertical resize

  let t:maximizer_sizes.after = winrestcmd()

  if &buftype != 'terminal'
    normal! ze
  endif
endfunction

function! s:Restore() abort
  if exists('t:maximizer_sizes')
    silent! execute t:maximizer_sizes.before

    if t:maximizer_sizes.before != winrestcmd()
      wincmd =
    endif

    unlet t:maximizer_sizes

    if &buftype != 'terminal'
      normal! ze
    endif
  endif
endfunction

function! human#maximizer#Toggle() abort
  if exists('t:maximizer_sizes') &&
        \ t:maximizer_sizes.after == winrestcmd()
    call <SID>Restore()
  elseif winnr('$') > 1
    call <SID>Enable()
  endif
endfunction

