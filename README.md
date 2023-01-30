# NVIM-CONFIG

My nvim-config based on [0 to LSP: Neovim RC From Scratch](https://www.youtube.com/watch?v=w7i4amO_zaE) from [ThePrimagen](https://github.com/ThePrimeagen).
To use the configuration you need to copy the folder into your neovim-configuration folder (default: `~/.config/nvim`), start
up neovim, run `:PackerSync` and check the config for `post-install` sections for the plugins.


The following plugins are used:

| Plugin | Description |
|--------|-------------|
| [packer.nvim](https://github.com/wbthomason/packer.nvim) | Plugin Manager |
| [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim) | Language Server for basic IDE functionality |
| [nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python) | Debugger for python | yes |
| [telescope-nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy Finder |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax Highlighting and more syntax-tree functionality |
| [undotree](https://github.com/mbbill/undotree) | keeps track of changes in files |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | in-line diagnostics|


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

---

## To do

- [x] linters on save
- [ ] floating terminal
- [ ] lazygit integration
- [ ] leader-bar showing possible options
- [ ] make sure lsp works with python
- [ ] make sure debugger works with pytest
- [ ] open autocomplete menu on `<C-Space>`
- [X] store config in git-repo
- [ ] use system clipboard
