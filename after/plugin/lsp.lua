-- config for lsp-zero<https://github.com/VonHeikemen/lsp-zero.nvim>

local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
	"sumneko_lua",
	"rust_analyzer",
	"pyright",
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "<leader>lq", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>ld", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "<leader>ln", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "<leader>lp", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>la", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>lr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>lm", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("n", "<leader>ls", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
