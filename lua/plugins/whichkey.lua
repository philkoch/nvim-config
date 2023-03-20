-- https://github.com/folke/which-key.nvim
-- popup that displays possible key combinations on <leader>
return {
	"folke/which-key.nvim",
	lazy = false,
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300

		local wk = require("which-key")
		-- telescope keymaps
		local telescope_builtin = require("telescope.builtin")
		wk.register({
			f = {
				name = " FIND",
				b = { telescope_builtin.buffers, "Find Buffer" },
				c = { telescope_builtin.command_history, "Find Command" },
				f = { telescope_builtin.find_files, "Find File" },
				t = { telescope_builtin.live_grep, "Find Text" },
				h = { telescope_builtin.help_tags, "Find Help" },
				r = { telescope_builtin.oldfiles, "Find Recent File" },
				j = { telescope_builtin.jumplist, "Find Jump" },
				q = { telescope_builtin.quickfix, "Find QuickFix" },
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

		-- others
		wk.register({
			g = {
				name = " GIT",
				g = { "<cmd>LazyGit<CR>", "lazygit" },
			},
			u = "  UNDOTREE",
			h = { "<cmd>noh<CR>", "  NO HIGHLIGHT" },
			x = "  TROUBLE TOGGLE",
			y = {
				function()
					if require("peek").is_open() then
						require("peek").close()
					else
						require("peek").open()
					end
				end,
				"  .MD PREVIEW",
			},
		}, { prefix = "<leader>" })

		-- debugger
		wk.register({
			d = {
				name = " DEBUG",
				n = { "<cmd>lua require('dap').continue()<CR>", "Launch / Continue" },
				x = { "<cmd>lua require('dap').terminate()<CR>", "Stop" },
				m = { "<cmd>lua require('dap-python').test_method()<CR>", "Test Method" },
				b = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle Breakpoint" },
				o = { "<cmd>lua require('dap').step_over()<CR>", "Step Over" },
				i = { "<cmd>lua require('dap').step_into()<CR>", "Step Into" },
				u = { "<cmd>lua require('dap').step_out()<CR>", "Step Out" },
				r = { "<cmd>lua require('dap').restart()<CR>", "Restart Session" },
				p = { "<cmd>lua require('dap').repl.open()<CR>", "Open REPL" },
				c = {

					function()
						vim.ui.input({
							prompt = "Enter condition:",
						}, function(input)
							if input ~= nil then
								require("dap").toggle_breakpoint(input)
							end
						end)
					end,
					"Conditional Breakpoint",
				},
			},
		}, { prefix = "<leader>" })

		wk.setup()
	end,
}
