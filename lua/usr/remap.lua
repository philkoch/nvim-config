vim.g.mapleader = " "
-- while in normal mode pv is executed
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

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

-- does not replace copy-register when pasting in
-- a visually selected word
vim.keymap.set("x", "<leader>p", "\"_dP")
