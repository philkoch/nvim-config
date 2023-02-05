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
		e = { require("telescope").extensions.file_browser.file_browser, "Open File Browser", noremap = true },
	},
}, { prefix = "<leader>" })

-- mason keymaps
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

-- debugger
wk.register({
	d = {
		name = " DEBUG",
		c = { "<cmd>lua require('dap').continue()<CR>", "Continue" },
		x = { "<cmd>lua require('dap').terminate()<CR>", "Stop" },
		m = { "<cmd>lua require('dap-python').test_method()<CR>", "Test Method" },
		b = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle Breakpoint" },
		o = { "<cmd>lua require('dap').step_over()<CR>", "Step Over" },
		i = { "<cmd>lua require('dap').step_into()<CR>", "Step Into" },
		u = { "<cmd>lua require('dap').step_into()<CR>", "Step Out" },
		r = { "<cmd>lua require('dap').restart()<CR>", "Restart Session" },
		p = { "<cmd>lua require('dap').repl.open()<CR>", "Open REPL" },
	},
}, { prefix = "<leader>" })

wk.setup()
