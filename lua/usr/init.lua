-- neovim options
vim.cmd("colorscheme nightfox")

-- line numbers
vim.opt.nu = true
-- relative line numbers
vim.opt.relativenumber = true
-- set tabs to 4 spaces instead of 8
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- convert tabs to spaces
vim.opt.expandtab = true

-- does smart autoindenting when starting a new line
vim.opt.autoindent = true
vim.opt.smartindent = true

-- prevents wrapping of long lines
vim.opt.wrap = false

vim.opt.swapfile = false
-- better undos
vim.opt.undodir = os.getenv("HOME") .. "/.config/.nvim/undo"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true
-- minimum number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.colorcolumn = "80"

-- enables in-line diagnostics
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})
