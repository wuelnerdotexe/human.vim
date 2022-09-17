" vim: fileencoding=utf-8 tabstop=2 shiftwidth=2 foldlevel=0 foldmethod=marker:
" -----------------------------------------------------------------------------
" Name:     bufonly.vim
" Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
" URL:      https://github.com/wuelnerdotexe/human.vim
" License:  Copyright (c) 2003 Christian J. Robinson and contributors.
" About:    Delete all buffers except the current.
" -----------------------------------------------------------------------------

function! s:ExcludeFiletypes(bufnum)
  if exists('bufonly_exclude_filetypes')
    return index(
          \   g:bufonly_exclude_filetypes,
          \   getbufvar(a:bufnum, '&filetype')
          \ ) >= 0 ? 1 : 0
  else
    return 0
  endif
endfunction

function! human#bufonly#Run() abort
  let l:buffer = bufnr('%')
  let l:last_buffer = bufnr('$')

  let l:count = 1
  let l:delete_count = 0

  while l:count <= l:last_buffer
    if l:count != l:buffer
          \ && !<SID>ExcludeFiletypes(l:count)
          \ && buflisted(l:count)
      silent execute l:count . 'bwipe'

      if !buflisted(l:count)
        let l:delete_count = l:delete_count + 1
      endif
    endif

    let l:count = l:count + 1
  endwhile
endfunction

