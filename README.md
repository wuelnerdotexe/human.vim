# Vim for Humans

> Name inspired by the [song](https://open.spotify.com/track/1sTsuZTdANkiFd7T34H3nb?si=b231c228a346487c) of my favorite band [The Killers](https://open.spotify.com/playlist/5NG4GhpKm6kQy3vtVt4nxs?si=b30370b24e1646c3).

Collection of Vim default options for humans.

Features:

- Default options for Vim to be your friend.
- Key mappings to interact with buffers.
- Key mapping to clear the highlight search.
- `*`The text is highlighted when it has been yanked.
- The following plugins are included:
  - Maximizer: maximizes and restores the current window.

**Note:** features with `*` only available for [Neovim](https://github.com/neovim/neovim).

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

It also includes **minimalistic** and **modernized** plugins with **on-demand functions** to further enhance the human experience. It seems that these plugins are no longer maintained by their author, so I've included them here.

The plugins included are:

#### Maximizer

Maximizer lets you maximize split windows and restore them automatically. It is very useful if you like to have many split windows per tab.

Maximizer has only one command:

```vim
:MaximizerToggle
```

Which you can map to your favorite map, for example:

```vim
nmap <leader>mt <Plug>(MaximizerToggle)
nmap! <leader>mt <Plug>(MaximizerToggle)
```

When the current window is not in maximized state, Maximizer saves dimensions and positions of all windows in the current tab, and then it performs maximization of the active window. The second time the command is invoked, Maximizer restores all windows to the previously saved positions.

## Maintainer

> Hi 👋, I'm **[Wuelner](https://linktr.ee/wuelnerdotexe)**, a **software developer from Guatemala**, passionate about creating minimalist solutions using solid fundamentals focused on **"how things should be"**.

## Credits

- Plugin [vim-maximizer](https://github.com/szw/vim-maximizer) by. [Szymon Wrozynski](https://github.com/szw) and [Contributors](https://github.com/szw/vim-maximizer/commits/master).

## License

[MIT &copy; Wuelner Martínez.](https://github.com/wuelnerdotexe/human.vim/blob/main/LICENSE)

<p align="center">With 💖 from <strong>LATAM</strong> to the world!</p>
