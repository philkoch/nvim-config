-- config for lsp-zero<https://github.com/VonHeikemen/lsp-zero.nvim>
return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v1.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-cmdline" },
		{ "hrsh7th/nvim-cmp" },

		-- Snippets
		{ "rafamadriz/friendly-snippets" },
		-- lsp-colors
		"folke/lsp-colors.nvim",
	},
	config = function()
		local lsp = require("lsp-zero")

		lsp.preset("recommended")
		lsp.ensure_installed({
			"sumneko_lua",
			"rust_analyzer",
			"pyright",
		})

		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		local cmp_compare = cmp.config.compare
		local cmp_mappings = lsp.defaults.cmp_mappings({
			["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
			["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
			["<C-y>"] = cmp.mapping.confirm({ select = true }),
			["<C-Space>"] = cmp.mapping.complete(),
		})

		lsp.setup_nvim_cmp({
			mapping = cmp_mappings,
			sorting = {
				comparators = {
					cmp_compare.offset,
					cmp_compare.exact,
					cmp_compare.score,
					cmp_compare.recently_used,
					cmp_compare.locality,
					cmp_compare.kind,
					cmp_compare.sort_text,
					cmp_compare.length,
					cmp_compare.order,
				},
			},
		})

		lsp.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, remap = false }
			vim.keymap.set("n", "gd", function()
				require("telescope.builtin").lsp_definitions()
			end, opts)
			vim.keymap.set("n", "<leader>lq", function()
				vim.lsp.buf.hover()
			end, opts)
			vim.keymap.set("n", "<leader>ld", function()
				require("telescope.builtin").diagnostics({ bufnr = bufnr })
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
				require("telescope.builtin").lsp_references()
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

		lsp.configure("pyright", {
			-- look for poetry-lock file and set the correct venv in
			-- neovim to make pyright behave correctly without calling
			-- poetry shell before opening neovim
			on_new_config = function(config, root_dir)
				local match = vim.fn.glob(vim.fn.getcwd() .. "/poetry.lock")
				local cur_venv = vim.env.VIRTUAL_ENV
				if match ~= "" and cur_venv == nil or cur_venv == "" then
					local venv_path = vim.fn.trim(vim.fn.system("poetry env info -p"))
					vim.env.VIRTUAL_ENV = venv_path
					vim.env.PATH = venv_path .. "/bin:" .. vim.env.PATH
					config.settings.python.pythonPath = venv_path .. "/bin/python"
				end
			end,
		})

		lsp.setup()

		-- enables in-line diagnostics
		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})
	end,
}
