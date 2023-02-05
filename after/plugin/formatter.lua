-- https://github.com/mhartington/formatter.nvim
-- Utilities for creating configurations
local util = require("formatter.util")
local formatter = require("formatter")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
formatter.setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		json = {
			function()
				return {
					exe = "jq",
					stdin = true,
				}
			end,
		},
		python = {
			require("formatter.filetypes.python").isort,
			function()
				-- run the black package instead of the
				-- builtin black for improved speed
				return {
					exe = "black",
					stdin = false,
				}
			end,
		},
		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

-- Autocmd for format on save
local group = vim.api.nvim_create_augroup("formatter.nvim", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*",
	group = group,
	callback = function()
		vim.cmd("FormatWrite")
	end,
})
