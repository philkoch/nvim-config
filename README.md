# NVIM-CONFIG

My nvim-config based on [0 to LSP: Neovim RC From Scratch](https://www.youtube.com/watch?v=w7i4amO_zaE) from [ThePrimagen](https://github.com/ThePrimeagen).
To use the configuration you need to copy the folder into your neovim-configuration folder (default: `~/.config/nvim`), start
up neovim, run `:Lazy` and check the config for `post-install` sections for the plugins.

> Check `./lua/plugins` for configurations of each plugin

The following plugins are used:

| Plugin | Description |
|--------|-------------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin Manager |
| [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim) | Language Server for basic IDE functionality |
| [nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python) | Debugger for python | yes |
| [telescope-nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy Finder |
| [telescope-file-browser](https://github.com/nvim-telescope/telescope-file-browser.nvim) | file explorer |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax Highlighting and more syntax-tree functionality |
| [undotree](https://github.com/mbbill/undotree) | keeps track of changes in files |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | in-line diagnostics |
| [FTerm](https://github.com/numToStr/FTerm.nvim) | a floating terminal inside neovim |
| [lazygit-nvim](https://github.com/kdheepak/lazygit.nvim) | lazygit integration |
| [which-key](https://github.com/folke/which-key.nvim) | shows configured keymappings on <leader> |
| [comment](https://github.com/numToStr/Comment.nvim) | context aware comments |
| [luasnip](https://github.com/L3MON4D3/LuaSnip) | allows to define code snippets |
| [catppuccin](https://github.com/catppuccin/nvim) | colorscheme |
| [neogen](https://github.com/danymat/neogen) | generates documentation |
| [peek](https://github.com/toppair/peek) | markdown file preview |
| [vim-wakatime](https://github.com/wakatime/vim-wakatime) | easy time-tracking |
| [neodev](https://github.com/folke/neodev.nvim) | autocompletion for neovim apis |
| [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) | general purpose lsp, runs formatters/linters |

---

## nvim-dap-python post-install

[nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python) requires
debugpy to run. Since I like to keep everything that has to do with neovim in
one folder. I've created a `.virtualenvs` subfolder and installed it there

```shell
cd ~/.config/nvim
mkdir .virtualenvs
cd .virtualenvs
python venv .virtualenvs
python -m venv debugpy
debugpy/bin/python -m pip install debugpy
```

in neovim run (:warning:treesitter-plugin required!!)

```
:TSInstall python
```

## formatter post-install

The formatter uses an external instance of black, you need
[black](https://github.com/psf/black) installed on your system, when working
with `*.py`-files

## peek pre-install

[deno](https://deno.land/) is required for rendering markdown. Install it
from the package repo of your distro.

## Improvements / Issues

- [ ] re-order dap-ui windows (variables top left, watches bottom left)
- [ ] :h marks
- [ ] check out lazy loading plugins
- [ ] :bug: lazy complains that tags file is not sorted when navigating help pages
- [ ] check out [refactoring.nvim](https://github.com/ThePrimeagen/refactoring.nvim)
- [ ] add test-runner which displays the results per test in quickfix lists -- see <https://www.youtube.com/watch?v=cf72gMBrsI0> for inspiration
- [ ] disable colorcolumn when no line is longer than the configured length
- [ ] check out sessions, see if it's possible to remember last open windows for each project
- [ ] color line where debugger is currently on
- [ ] restart last debug-session on shortcut
- [ ] pylint is way too slow when invoked via null-ls, improve that
- [x] nvim-cmp remove text-proposals. They're mostly not what I want.
- [x] gl needs to just display the diagnosis popup instead of launching telescope
- [x] add telescope for help-pages
- [x] open quickfix list in telescope for file preview
- [x] [Debug pytest file](https://github.com/mfussenegger/nvim-dap-python/issues/74)
- [x] dap -- see if it's possible that not all buffers are changed to the current breakpoint
- [x] lsp json server missing / not starting
- [x] add input function for conditional breakpoint
- [x] replace formatter/linter with null-ls
