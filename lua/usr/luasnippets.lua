-- https://github.com/L3MON4D3/LuaSnip
-- load snippets from ./snippets
local ls = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })

-- Map "Ctrl + p" (in insert mode)
-- to expand snippet and jump through fields.
vim.keymap.set("i", "<c-p>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end)
