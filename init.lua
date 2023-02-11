-- neovim configs

-- set leader key to <Space>
vim.g.mapleader = " "

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

vim.opt.colorcolumn = "88"

-- enables in-line diagnostics
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})
-- disables displaying of mode (this is done by lualine also)
vim.opt.showmode = false

-- hide commandline when it's not used
vim.opt.cmdheight = 0

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
vim.keymap.set("v", ">", ">> gv=gv")
vim.keymap.set("v", "<", "<< gv=gv")

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

-- load plugins
require("lazy").setup("plugins")

-- set colorscheme after loading plugins
vim.cmd.colorscheme("catppuccin")
