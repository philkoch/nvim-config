return {
	"lukas-reineke/indent-blankline.nvim",
	name = "indent-blankline",
	lazy = false,
	config = function()
		require("indent_blankline").setup({
			space_char_blankline = " ",
			char_highlight_list = {
				"IndentBlanklineIndent1",
				"IndentBlanklineIndent2",
				"IndentBlanklineIndent3",
				"IndentBlanklineIndent4",
				"IndentBlanklineIndent5",
				"IndentBlanklineIndent6",
			},
		})
	end,
}