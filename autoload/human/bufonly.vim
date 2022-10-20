" vim: fileencoding=utf-8 tabstop=2 shiftwidth=2 foldlevel=0 foldmethod=marker:
" -----------------------------------------------------------------------------
" Name:     bufonly.vim
" Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
" URL:      https://github.com/wuelnerdotexe/human.vim
" License:  Copyright (c) 2003 Christian J. Robinson and contributors.
" About:    Delete all buffers except the current.
" -----------------------------------------------------------------------------

function! s:ExcludeBuffers(bufnum)
  if getbufvar(a:bufnum, '&modified')
    return 1
  elseif exists('bufonly_exclude_buftypes') && index(
        \   g:bufonly_exclude_buftypes,
        \   getbufvar(a:bufnum, '&buftype')
        \ ) >= 0
    return 1
  elseif exists('bufonly_exclude_filetypes') && index(
        \   g:bufonly_exclude_filetypes,
        \   getbufvar(a:bufnum, '&filetype')
        \ ) >= 0
    return 1
  endif

  return 0
endfunction

function! human#bufonly#Run() abort
  let l:count = 1
  let l:delete_count = 0

  while l:count <= bufnr('$')
    if l:count != bufnr('%') && buflisted(l:count)
          \ && !<SID>ExcludeBuffers(l:count)
      silent execute l:count . 'bwipeout!'

      if !buflisted(l:count)
        let l:delete_count = l:delete_count + 1
      endif
    endif

    let l:count = l:count + 1
  endwhile
endfunction

