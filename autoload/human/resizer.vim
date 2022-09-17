" vim: fileencoding=utf-8 tabstop=2 shiftwidth=2 foldlevel=0 foldmethod=marker:
" -----------------------------------------------------------------------------
" Name:     resizer.vim
" Author:   Simeji <https://github.com/simeji/winresizer>
" URL:      https://github.com/wuelnerdotexe/human.vim
" License:  MIT (c) Simeji and Contributors.
" About:    Resize the current split window.
" -----------------------------------------------------------------------------

function! s:CanMoveCursorFromCurrentWindow(direction) abort
  let l:key_directions = { 'left': 'h', 'down': 'j', 'up': 'k', 'right': 'l' }

  if has_key(l:key_directions, a:direction)
    let l:direction = l:key_directions[a:direction]
  elseif index(values(l:key_directions), a:direction) != -1
    let l:direction = a:direction
  endif

  let l:from_window = winnr()
  execute 'wincmd ' . l:direction

  let l:to_window = winnr()
  execute l:from_window . 'wincmd w'

  return l:from_window != l:to_window
endfun

function! s:GetEdgeInfo() abort
  let l:directions = [ 'left', 'down', 'up', 'right' ]
  let s:result = {}

  for l:direction in l:directions
    execute 'let s:result["' . l:direction . '"] = ' .
          \ !<SID>CanMoveCursorFromCurrentWindow(l:direction)
  endfor
  
  return s:result
endfun

function! s:GetResizeBehavior() abort
  let l:operator = { 'left': '-', 'down': '+', 'up': '-', 'right': '+' }
  let s:result = {}
  let l:edge_info = <SID>GetEdgeInfo()

  if !l:edge_info['left'] && l:edge_info['right']
    let l:operator['left'] = '+'
    let l:operator['right'] = '-'
  endif

  if !l:edge_info['up'] && l:edge_info['down']
    let l:operator['up'] = '+'
    let l:operator['down'] = '-'
  endif

  return l:operator
endfunction

function! human#resizer#Run(direction) abort
  let l:resize_behavior = <SID>GetResizeBehavior()

  if a:direction == 'left'
    execute 'vertical resize ' . l:resize_behavior["left"] . '3'
  elseif a:direction == 'down'
    execute 'resize ' . l:resize_behavior["down"] . '3'
  elseif a:direction == 'up'
    execute 'resize ' . l:resize_behavior["up"]   . '3'
  elseif a:direction == 'right'
    execute 'vertical resize ' . l:resize_behavior["right"] . '3'
  endif
endfunction

