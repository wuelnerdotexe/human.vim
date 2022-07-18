" vim: fileencoding=utf-8 tabstop=2 shiftwidth=2 foldlevel=0 foldmethod=marker:
" -----------------------------------------------------------------------------
" Name:     numbers.vim
" Author:   Mahdi Yusuf <https://github.com/myusuf3/numbers.vim>
" URL:      https://github.com/wuelnerdotexe/human.vim
" License:  MIT License. Mahdi Yusuf and Contributors.
" About:    Vim global plugin for better line numbers.
" -----------------------------------------------------------------------------

function numbers#set()
  let g:numbers_mode = 1
  call numbers#reset()
endfunction

function numbers#reset()
  if(g:numbers_center == 0)
    call numbers#relativeOff()
  elseif(g:numbers_mode == 0)
    set relativenumber
  else
    call numbers#relativeOff()
  endif
  if index(g:numbers_exclude_filetypes, &ft) >= 0 ||
        \ index(g:numbers_exclude_buftypes, &bt) >= 0
    setlocal norelativenumber
    if g:numbers_original == 0
      setlocal nonumber
    else
      setlocal number
    endif
  endif
endfunction

function numbers#relativeOn()
  let g:numbers_mode = 0
  call numbers#reset()
endfunction

function numbers#relativeOff()
  set norelativenumber
endfunction

function numbers#center()
  let g:numbers_center = 1
  call numbers#reset()
endfunction

function numbers#uncenter()
  let g:numbers_center = 0
  call numbers#reset()
endfunction
