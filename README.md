# Vim for Humans

> Name inspired by the [song](https://open.spotify.com/track/1sTsuZTdANkiFd7T34H3nb?si=b231c228a346487c) of my favorite band [THE KILL⚡RS](https://open.spotify.com/playlist/5NG4GhpKm6kQy3vtVt4nxs?si=b30370b24e1646c3).

Collection of **Vim** default options **for humans**.

Features:

- Default native options for Vim to be your friend.
- Autocmds:
  - Jump to last cursor position with fold support.
  - Automagically save and load views for all files.
  - Equalize splits if UI window got resized.
  - `#`Update file on if changed somewhere else.
  - `*`The text is highlighted when it has been yanked.
- Mappings:
  - Better navigating between word wrap lines.
  - `#`Added default Neovim's mappings to Vim.
  - Comfortable indentation with `>` and `<` keys.
  - More mappings for navigation with buffers.
  - And, mappings for toggle options on-demand.

<small>**NOTE:** feats with `#` only available for Vim and feats with `*` only available for Neovim.</small>

## Requirements

- [Vim](https://www.vim.org/) >= 8.0 or [Neovim](https://neovim.io/) >= v0.7.0

## Installation

You can install `human.vim` in many ways that you know and prefer, just make sure to load it before all your other plugins to ensure you don't overwrite any options contained in those other plugins.

## Usage

To use this plugin you just have to install it, load it correctly and you will start to notice small changes in Vim or Neovim that will make more sense by default.

### Options

To see the many options contained in this plugin, look directly at the source code in the `plugin/human.vim` directory, where all the options are nicely organized. **If you need to change the value of an option** contained in this plugin, you **must do so after loading this plugin**, otherwise, your options value will be rewritten.

### Mappings

#### Local leader

This plugin sets the `<LocalLeader>` key to a `|` (pipe), to avoid clash with default `<Leader>` key, only if the `localleader` variable has not been previously set.

#### Neovim's defaults

The following Neovim's default mappings are created for Vim:

```vim
nnoremap Y y$
nnoremap <C-L> <Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>
xnoremap * y/\V<C-R>"<CR>
xnoremap # y?\V<C-R>"<CR>
nnoremap & :&&<CR>
```

#### Navigation with buffers

Also, creates the following mappings to navigate between buffers, following the same **Vim philosophy** for navigating between tabs. **Why not** include it by default!

|      VI Mode      |        Keymap         | Description               |
| :---------------: | :-------------------: | ------------------------- |
|      Normal       |       `g` + `B`       | Go to the previous buffer |
| Normal and Insert |  `SHIFT` + `PAGE UP`  | Go to the previous buffer |
|      Normal       |       `g` + `b`       | Go to the next buffer     |
| Normal and Insert | `SHIFT` + `PAGE DOWN` | Go to the next buffer     |

#### Toggle options

Finally, creates the following mappings to toggle some Vim options that are useful **on-demand** but **not all the time**.

| VI Mode |        Keymap        | Description                  |
| :-----: | :------------------: | ---------------------------- |
| Normal  | `<underscore>` + `l` | Toggle `cursorline` option   |
| Normal  | `<underscore>` + `c` | Toggle `cursorcolumn` option |
| Normal  | `<underscore>` + `s` | Toggle `spell` option        |
| Normal  | `<underscore>` + `w` | Toggle `wrap` option         |

## Maintainer

> Hi 👋, I'm **[Wuelner](https://linktr.ee/wuelnerdotexe)**, a **software developer from Guatemala**, passionate about creating minimalist solutions using solid fundamentals focused on **"how things should be"**.

## License

[MIT &copy; Wuelner Martínez.](https://github.com/wuelnerdotexe/human.vim/blob/main/LICENSE)

<p align="center">With 💖 from <strong>LATAM</strong> to the world!</p>
