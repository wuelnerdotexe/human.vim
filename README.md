# Vim for Humans

> Name inspired by the song of my favorite band [The Killers](https://open.spotify.com/playlist/5NG4GhpKm6kQy3vtVt4nxs?si=307ea3da0bee4841).

Collection of vim default options for humans.

Features:

- Default options for vim to be your friend.
- Key mappings to interact with buffers.
- *The text is highlighted when it has been yanked.
- The following plugins are included:
  - Maximizer: maximizes and restores the current window.
  - Numbers: vim global plugin for better line numbers.

**Note:** features with '*' only available for [neovim](https://github.com/neovim/neovim).

## Installation

Install via your preferred package manager. Example using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'wuelnerdotexe/human.vim'
```

**Important:** it should always be at the top of the list to make sure you don't overwrite options contained in other plugins.

## Usage

To use this plugin you just have to install it, and you will start to notice small changes in Vim that will make more sense. If you need to change the value of an option contained in this plugin, you must do so after loading the plugin in your `VIMRC` file or in a separate file in the `after/plugin/` folder, if you do it before, your options will be rewritten.

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

It also includes two **minimalistic** and **modernized** plugins with **on-demand functions** to further enhance the human experience. It seems that these plugins are no longer maintained by their author, so I've included them here.

The plugins included are:

#### Maximizer

Maximizer lets you maximize split windows and restore them automatically. It is very useful if you like to have many split windows per tab.

Maximizer has only one command:

```
:MaximizerToggle
```

When the current window is not in maximized state, Maximizer saves dimensions and positions of all windows in the current tab, and then it performs maximization of the active window. The second time the command is invoked, Maximizer restores all windows to the previously saved positions.

Enabled by default, but you can disable it by initializing the following variable before loading **Vim for Humans**. For example:

```vim
let g:loaded_maximizer = 0
```

#### Numbers

Numbers is a plugin for intelligently toggling line numbers.

This plugin alternates between relative numbering (`relativenumber`) and absolute numbering (`number`) for the active window depending on the mode you are in. In a GUI, it also functions based on whether or not the app has focus.

Enabled by default, but you can disable it by initializing the following variable before loading **Vim for Humans**. For example:

```vim
let g:loaded_numbers = 0
```

If you see numbers where they don't belong like in the Vim `:help` menus or other plugins, be sure to add the **FileTypes** or **BufTypes** used by your plugins to the excludes list. The default values for excluded types are:

```vim
" Numbers for Humans exclude filetypes.
let g:numbers_exclude_filetypes = [ 'nerdtree', 'netrw', 'startify' ]

" Numbers for Humans exclude buftypes.
let g:numbers_exclude_buftypes = [ 'help', 'nofile', 'quickfix' ]
```

## Maintainer

> Hola 👋, soy **[Wuelner](https://linktr.ee/wuelnerdotexe)**, un **software developer de Guatemala**, apasionado por crear soluciones minimalistas utilizando fundamentos sólidos enfocados en **"cómo deben ser las cosas"**.

## Credits

- Plugin [numbers.vim](https://github.com/myusuf3/numbers.vim) by. [Mahdi Yusuf](https://github.com/myusuf3) and [Contributors](https://github.com/myusuf3/numbers.vim/commits/master).
- Plugin [vim-maximizer](https://github.com/szw/vim-maximizer) by. [Szymon Wrozynski](https://github.com/szw) and [Contributors](https://github.com/szw/vim-maximizer/commits/master).

## License

[MIT &copy; Wuelner Martínez.](https://github.com/wuelnerdotexe/human.vim/blob/main/LICENSE)

<p align="center">¡Con 💖 de <strong>Latinoamérica</strong> para el mundo!</p>
