-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	-- Simple plugins can be specified as strings
	use("rstacruz/vim-closer")
	-- fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- file explorer
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	-- better performance for fuzzy finder
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	-- coloschemes
	use("EdenEast/nightfox.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	-- treesitter for code parsing
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	-- Language Server
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
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
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})
	-- formatter
	use({ "mhartington/formatter.nvim" })
	-- linter
	use("mfussenegger/nvim-lint")
	-- lsp-colors
	use("folke/lsp-colors.nvim")
	-- keeps undo across everything
	use("mbbill/undotree")
	-- in-line diagnostics
	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})
	-- statusline
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	-- debugger
	use({
		"mfussenegger/nvim-dap-python",
		requires = { "mfussenegger/nvim-dap" },
	})
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

	-- floating terminal
	use("numToStr/FTerm.nvim")
	-- lazygit inside nvim
	use("kdheepak/lazygit.nvim")
	-- popup that displays possible key combinations on <leader>
	use("folke/which-key.nvim")
	-- lsp supported comments
	use("numToStr/Comment.nvim")
	-- automatic documentation generation
	use({
		"danymat/neogen",
		requires = "nvim-treesitter/nvim-treesitter",
		tag = "*",
	})
end)
