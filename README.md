# Vim for Humans

> Name inspired by the song of my favorite band [The Killers](https://open.spotify.com/playlist/5NG4GhpKm6kQy3vtVt4nxs?si=307ea3da0bee4841).

Collection of Vim default options for humans.

Features:

- Default options for Vim to be your friend.
- Key mappings to interact with buffers.
- *The text is highlighted when it has been yanked.
- The following plugins are included:
  - Maximizer: maximizes and restores the current window.

**Note:** features with '*' only available for [Neovim](https://github.com/neovim/neovim).

## Installation

Install via your preferred package manager. Example using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'wuelnerdotexe/human.vim'
```

**Important:** it should always be at the top of the list to make sure you don't overwrite options contained in other plugins.

## Usage

To use this plugin you just have to install it, and you will start to notice small changes in Vim that will make more sense.

### Options.

If you need to change the value of an option contained in this plugin, you must do so after loading the plugin in your `VIMRC` file or in a separate file in the `after/plugin/` folder, if you do it before, your options will be rewritten. Learn about the options in the `plugin/human.vim` source code.

### Mappings

**Vim for Humans** creates key mappings to navigate between buffers, following the same **Vim philosophy** for navigating between tabs. **Why not** include it by default!

The "smart" mappings are:

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
