-- OPTIONS >>>>>>>>

-- set leader key to <Space>
vim.g.mapleader = " "

-- line numbers
vim.opt.nu = true

-- relative line numbers
vim.opt.relativenumber = true
--
-- set tabs to 4 spaces instead of 8
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- convert tabs to spaces
vim.opt.expandtab = true

-- highlight cursor position
vim.opt.cursorline = true

-- does smart autoindenting when starting a new line
vim.opt.autoindent = true
vim.opt.smartindent = true

-- prevents wrapping of long lines
vim.opt.wrap = false

-- don't create a swapfile
vim.opt.swapfile = false

-- better undos (the plugin `undotree` is also used)
vim.opt.undodir = os.getenv("HOME") .. "/.config/.nvim/undo"
vim.opt.undofile = true

-- start searching while typing and
-- highlight results
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- case-sensitive search when using uppercase letters,
-- case-insensitive otherwise
vim.opt.smartcase = true

-- use terminal gui colors
vim.opt.termguicolors = true

-- minimum number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 8

-- number of columns the screen is moved when the cursor would leave it
vim.opt.sidescroll = 1
-- minimum number of columns to keep visible when scrolling horizontally
vim.opt.sidescrolloff = 16

-- adds a column next to the line numbers holding symbols
-- for diagnostics or information like if a breakpoint is
-- on that line
vim.opt.signcolumn = "yes"

-- colored column indicating preferred max line length
vim.opt.colorcolumn = "88"

-- disables displaying of mode (this is done by lualine)
vim.opt.showmode = false

-- hide commandline when it's not used
vim.opt.cmdheight = 0

-- checks if buffer is already loaded and if so
-- opens it in that window
vim.opt.swb = "useopen"

-- limit elements in pop-up windows to 8 (e.g. nvim-cmp)
vim.opt.pumheight = 8

-- open vertical split windows to the right
vim.opt.splitright = true

-- open horizontal split down
vim.opt.splitbelow = true

-- use system clipboard as default
vim.opt.clipboard = "unnamedplus"

-- see :h shortmess for options
vim.opt.shortmess = "filmxstToOF"

-- treeview in netrw
vim.g.netrw_liststyle = 3

-- KEY MAPPINGS >>>>>>>>

-- netrw file explorer
vim.api.nvim_set_keymap("n", "<leader>e", ":Lexplore<CR> :vertical resize 30<CR>", { noremap = true })

-- moves selected lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keeps cursor in the middle of the screen
-- when jumping half pages up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search results stay in the middle of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- easier indent in visualmode
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- move cursor between buffers
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- easier buffer resizing
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- AUTOCOMMANDS >>>>>>>>

-- open :help in vertical split
vim.api.nvim_create_autocmd("BufWinEnter", {
    group = vim.api.nvim_create_augroup("help_window_right", {}),
    pattern = { "*.txt" },
    callback = function()
        if vim.o.filetype == "help" then
            vim.cmd.wincmd("L")
        end
    end,
})

-- PLUGINS >>>>>>>>

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", { defaults = { lazy = false } })

-- COLORSCHEME >>>>>>>
-- set colorscheme AFTER loading plugins
vim.cmd.colorscheme("catppuccin")

-- highlights the current line number
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#f9e2af", bg = "#33313a", bold = true })
-- color of line the debugger is on
vim.api.nvim_set_hl(0, "debugPC", { fg = "#f9e2af", bg = "#33313a", bold = true })
