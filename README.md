# Vim for Humans

> Name inspired by the [song](https://open.spotify.com/track/1sTsuZTdANkiFd7T34H3nb?si=b231c228a346487c) of my favorite band [The Killers](https://open.spotify.com/playlist/5NG4GhpKm6kQy3vtVt4nxs?si=b30370b24e1646c3).

Collection of Vim default options for humans.

Features:

- Default options for Vim to be your friend.
- Key mappings to interact with buffers.
- Better indenting with `>` and `<` keys.
- `*`The text is highlighted when it has been yanked.
- Key mapping to clear the highlight search.
- The following plugins are included to make you a ninja with buffers and windows:
  - BufOnly: delete all buffers except the current.
  - Maximizer: maximizes and restores the current window.
  - Resizer: resize the current split window.

**Note:** features with `*` only available for [Neovim](https://github.com/neovim/neovim).

## Requirements

- [Vim](https://www.vim.org/) >= 8.0
- [Neovim](https://neovim.io/) >= v0.7.0

### Dependencies

- [Ripgrep](https://github.com/BurntSushi/ripgrep) (optional)

## Installation

Install via your preferred package manager. Example using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'wuelnerdotexe/human.vim'
```

**Important:** it should always be at the top of the list to make sure you don't overwrite options contained in other plugins.

## Usage

To use this plugin you just have to install it, and you will start to notice small changes in Vim that will make more sense.

### Options.

To see the many options contained in this plugin, look directly at the source code in the `plugin/human.vim` directory, where all the options are nicely organized.

**if you need to change the value of an option** contained in this plugin, **you must do so after loading the plugin**; for which you will need to create an automatic command `autocmd VimEnter * set {option}` in your `VIMRC` file, or normally rewrite `set {option}` your options to a file in the `after /plugin/` directory.

**Warning**: Otherwise, your options value will be changed to **Vim for Humans**.

### Mappings

**Vim for Humans** creates key mappings to navigate between buffers, following the same **Vim philosophy** for navigating between tabs. **Why not** include it by default!

In addition, a key mapping `CTRL + L` in normal mode is also included to hide the highlight as a result of having the `hlsearch` option enabled when performing a search. This mapping is created only for Vim, because in Neovim it is already included by default.

The "smart" mappings for buffers are:

#### Normal mode

- Use `gB` for previous buffer.
- Use `gb` for next buffer.

#### Insert and visual mode

- Use `Shift + Page Down` for previous buffer.
- Use `Shift + Page Up` for next buffer.

### Plugins

It also includes **minimalistic** and **modernized** plugins with **on-demand functions** to further enhance the human experience.

The plugins included are:

#### BufOnly

BufOnly allows you to clear all buffers except the one you are in. This is an oddly useful feature that Vim provides for tabs and windows, but not for buffers.

BufOnly has only one command:

```vim
BufOnly
```

Which you can map to your favorite map, for example:

```vim
nmap 1b <Plug>(BufOnly)
```

In addition, BufOnly allows to exclude buffers by buftypes and filetypes, so as not to delete those that are not files, for example:

```vim
" Exclude buftypes for BufOnly command.
let g:bufonly_exclude_buftypes = [ 'terminal' ]

" Exclude filetypes for BufOnly command.
let g:bufonly_exclude_filetypes = [ 'aerial', 'fern' ]
```

#### Maximizer

Maximizer allows you to maximize and restore the size of the current window you are in.

The command for Maximizer is:

```vim
MaximizerToggle
```

Which you can map to your favorite map, for example:

```vim
nmap <C-w>m <Plug>(MaximizerToggle)
```

#### Resizer

Resizer allows you to resize the current split window, but in a visually more logical way, because the direction in which you resize is respected, as opposed to Vim's very gimmicky native mappings.

The Resizer commands are:

```vim
ResizerDown
```

```vim
ResizerLeft
```

```vim
ResizerUp
```

```vim
ResizerRight
```

Which you can map to your favorite map, for example:

```vim
nmap <A-h> <Plug>(ResizerLeft)
nmap <A-j> <Plug>(ResizerDown)
nmap <A-k> <Plug>(ResizerUp)
nmap <A-l> <Plug>(ResizerRight)
```

## Maintainer

> Hi 👋, I'm **[Wuelner](https://linktr.ee/wuelnerdotexe)**, a **software developer from Guatemala**, passionate about creating minimalist solutions using solid fundamentals focused on **"how things should be"**.

## Credits

- Plugin [BufOnly.vim](https://github.com/vim-scripts/BufOnly.vim) by. Christian J. Robinson.
- Plugin [vim-maximizer](https://github.com/szw/vim-maximizer) by. [Szymon Wrozynski](https://github.com/szw) and [Contributors](https://github.com/szw/vim-maximizer/commits/master).
- Plugin [winresizer](https://github.com/simeji/winresizer) by. [Simeji](https://github.com/simeji) and [Contributors](https://github.com/simeji/winresizer/commits/master).

## License

[MIT &copy; Wuelner Martínez.](https://github.com/wuelnerdotexe/human.vim/blob/main/LICENSE)

<p align="center">With 💖 from <strong>LATAM</strong> to the world!</p>
