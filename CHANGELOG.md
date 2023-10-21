# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.2.0] - 2023-10-20

### Added

- Optimized `virtualedit` option to unique "block" value.
- Enabled "End Of Buffer" (`eol`) icon.

## [2.1.1] - 2023-09-02

### Fixed

- Correctness `minwidth` and `minheight` values.

## [2.1.0] - 2023-08-02

### Added

- Automatic commands for save and load views are added.

## [2.0.2] - 2023-06-28

### Changed

- Some adjustments are made.

## [2.0.1] - 2023-05-24

### Changed

- Some options are updated.

## [2.0.0] - 2023-05-21

### Added

- Neovim's default mappings.

### Removed

- Human plugins.

### Changed

- Various improvements are added.

## [1.16.0] - 2023-05-13

### Added

- Improvements are added.

## [1.15.0] - 2023-04-07

### Changed

- Some options are now friendlier.

## [1.14.0] - 2023-02-06

### Added

- Set the `maplocalleader` global variable to `<underscore>` for avoid clash with the `<Leader>` global key.
- Key mappings for toggle some Vim options that are useful on-demand but not all the time are created.

## [1.13.0] - 2023-01-21

### Added

- Auto command for better `VimResized` is added.

## [1.12.3] - 2023-01-20

### Added

- More options for improve keymaps experience are added.

### Changed

- Moved `after/ftplugin` to `ftplugin` for allow users customizations.

## [1.12.2] - 2023-01-17

### Fixed

- Value `unammedplus` is used for `clipboard` option.

## [1.12.1] - 2023-01-15

### Fixed

- Removed the `resize` parameter from `sessionoptions`.

## [1.12.0] - 2023-01-13

### Added

- Various options are optimized and enhanced.

### Removed

- Removed languages options.

### Changed

- The loading of the options for `qf` is optimized.

## [1.11.0] - 2022-12-27

### Added

- Folding options are added.

## [1.10.0] - 2022-12-13

### Added

- Added auto reload of file if changed elsewhere.

## [1.9.0] - 2022-11-06

### Added

- Local settings for QuickFix are added.

### Changed

- Now create an on-demand function for the local options of `no-file` buffers.

### Fixed

- Performance is improved by initializing variables that are constantly repeated.

## [1.8.2] - 2022-11-05

### Fixed

- Fix tmux support.

## [1.8.1] - 2022-10-27

### Fixed

- Removed the `lazyredraw` option because it conflicts with the [noice.nvim](https://github.com/folke/noice.nvim) plugin.

## [1.8.0] - 2022-10-20

### Added

- A new variable `g:bufonly_exclude_buftypes` is added to "BufOnly" to exclude `buftypes`.
- Improvements for the Vim terminal are added.

## [1.7.3] - 2022-10-17

### Fixed

- Entering auto insert mode in terminal is disabled due to bugs in [nvim-dap](https://github.com/mfussenegger/nvim-dap).

## [1.7.2] - 2022-10-14

### Fixed

- Fix bug with `CTRL` + `l` map in Vim.
- More improvements are made.

## [1.7.1] - 2022-10-12

### Fixed

- Fix validation of `nvim 0.9.*` options.

## [1.7.0] - 2022-10-10

### Added

- Add Treesitter detection for `.mdx` files.
- Constant indentation is added with minor and major keys.
- The last cursor position is remembered when entering a file.
- Add keymaps for better navigation with wrapping.
- Set ripgrep to vimgrep.
- Undo files are activated.

The following plugins have been added to make `human.vim` a "Swiss Army Knife" of buffers and windows:

- BufferOnly an optimized port of [BufOnly.vim](https://github.com/vim-scripts/BufOnly.vim)
- Resizer an minimal port of [winresizer](https://github.com/simeji/winresizer)

### Fixed

- Many improvements, bug fixes and optimizations are made.

## [1.6.0] - 2022-09-07

### Added

- Added functionality to jump to the last remembered cursor position in Vim and Neovim.
- More improvements are added to option validations.

## [1.5.2] - 2022-09-04

### Fixed

- It is validated that the `<ESC>` map does not apply to fzf.

## [1.5.1] - 2022-08-29

### Fixed

- Options validation fixed.

## [1.5.0] - 2022-08-18

### Added

- For Neovim the global status line is activated.
- The documentation is better explained.

### Fixed

- The `mousescroll` option is enabled only for Neovim 8 onwards. Solving issue #1.
- Other options for Neovim are also validated.
- Ugly tab characters are removed.

## [1.4.0] - 2022-08-08

### Added

- Word wrap with a width of 80 characters is activated.

## [1.3.0] - 2022-07-23

### Added

- Mapping to clean up `:hlsearch` in Vim is added.
- Maps for plugins are added.
- Multiple enhancements are added to options.

## [1.2.0] - 2022-07-21

### Added

- Human options for the terminal are added.

## [1.1.1] - 2022-07-18

### Fixed

- The [numbers.vim](https://github.com/myusuf3/numbers.vim) plugin is removed because there is already an easier way to implement it. Why didn't I realize it before? If you want to get that feature back, install the [vim-numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle) plugin.

## [1.1.0] - 2022-07-18

### Added

- **Dark mode** is on by default because **humans hate light backgrounds**.
- **Minimalistic** and **modernized** versions of the [numbers.vim](https://github.com/myusuf3/numbers.vim) and [vim-maximized](https://github.com/szw/vim-maximizer) plugins are added.

## [1.0.0] - 2022-07-16

- Initial release

<p align="center">With 💖 from <strong>LATAM</strong> to the world!</p>
