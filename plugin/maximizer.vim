" vim: fileencoding=utf-8 tabstop=2 shiftwidth=2 foldlevel=0 foldmethod=marker:
" -----------------------------------------------------------------------------
" Name:     maximizer.vim
" Author:   Szymon Wrozynski <https://github.com/szw/vim-maximizer>
" URL:      https://github.com/wuelnerdotexe/human.vim
" License:  Copyright (c) 2012-2015 Szymon Wrozynski and Contributors.
" About:    Maximizes and restores the current window.
" -----------------------------------------------------------------------------

command -nargs=0 MaximizerToggle call human#maximizer#toggle()

autocmd WinLeave * call human#maximizer#restore()
