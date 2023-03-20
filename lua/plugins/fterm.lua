return {
	"numToStr/FTerm.nvim",
	lazy = false,
	config = function()
		require("FTerm").setup({
			border = "single",
			dimensions = {
				height = 0.9,
				width = 0.9,
			},
		})

		-- keybindings
		vim.keymap.set("n", "<C-t>", '<CMD>lua require("FTerm").toggle()<CR>')
		vim.keymap.set("t", "<C-t>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
	end,
}
