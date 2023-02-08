-- https://github.com/L3MON4D3/LuaSnip
-- source: TJDevries TakeTuesDay E03: Introduction to LuaSnip
-- load snippets from ./snippets
local ls = require("luasnip")
local types = require("luasnip.util.types")

require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })

-- Map "Ctrl + p" (in insert, select mode)
-- to expand snippet and jump through fields.
vim.keymap.set("i", "<c-p>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

-- Map "Ctrl + j" (in insert/select mode)
-- to jump backwards through fields
vim.keymap.set("i", "<c-j>", function()
	if ls.is_jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

-- Map "Ctrl + l" (in insert/select mode)
-- to change the selected snippet
vim.keymap.set("i", "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice()
	end
end, { silent = true })

ls.config.set_config({
	-- LuaSnip remembers the last snippet and allows jumping back to it
	-- even if the cursor moved outside the election
	history = true,
	updateevents = "TextChanged,TextChangedI",
	-- Autosnippets:
	enable_autosnippets = true,

	-- Crazy highlights
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "<-", "Error" } },
			},
		},
	},
})
