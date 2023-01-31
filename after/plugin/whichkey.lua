-- https://github.com/folke/which-key.nvim
vim.o.timeout = true
vim.o.timeoutlen = 300

local wk = require("which-key")
-- telescope keymaps
local telescope_builtin = require("telescope.builtin")
wk.register({
	f = {
		name = " FIND",
		b = { telescope_builtin.buffers, "Find Buffer" },
		f = { telescope_builtin.find_files, "Find File" },
		g = { telescope_builtin.git_files, "Find Git File" },
		h = { telescope_builtin.help_tags, "Find Help" },
		r = { telescope_builtin.old_files, "Find Recent File" },
	},
}, { prefix = "<leader>" })

-- mason keymaps
local mason = require("mason")
wk.register({
	m = {
		name = " MASON",
		o = { "<cmd>Mason<CR>", "Open" },
		i = { "<cmd>MasonInstall ", "Install..." },
		u = { "<cmd>MasonUninstall ", "Uninstall..." },
		l = { "<cmd>MasonLog ", "Log" },
	},
}, { prefix = "<leader>" })

-- Lsp keymaps
wk.register({
	l = {
		-- defined in lsp.lua
		name = " LSP",
		d = "Open Diagnostic",
		a = "Code action",
		r = "References",
		m = "Rename",
		n = "Next Diagnostic",
		p = "Previous Diagnostic",
		q = "Quick Documentation",
		s = "Signature Help",
	},
}, { prefix = "<leader>" })

-- rest
wk.register({
	g = {
		name = " GIT",
		g = { "<cmd>LazyGit<CR>", "lazygit" },
	},
	u = "  UNDOTREE",
	h = { "<cmd>noh<CR>", "  NO HIGHLIGHT" },
	x = "  TROUBLE TOGGLE",
}, { prefix = "<leader>" })

wk.setup()
