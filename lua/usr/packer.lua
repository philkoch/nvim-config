-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Simple plugins can be specified as strings
  use 'rstacruz/vim-closer'

  -- fuzzy finder
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- better performance for fuzzy finder
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- coloschemes
  use "EdenEast/nightfox.nvim"

  -- treesitter for code parsing
  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function()
		  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		  ts_update()
	  end,
  }

  -- Language Server

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},         -- Required
		  {'hrsh7th/cmp-nvim-lsp'},     -- Required
		  {'hrsh7th/cmp-buffer'},       -- Optional
		  {'hrsh7th/cmp-path'},         -- Optional
		  {'saadparwaiz1/cmp_luasnip'}, -- Optional
		  {'hrsh7th/cmp-nvim-lua'},     -- Optional

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},             -- Required
		  {'rafamadriz/friendly-snippets'}, -- Optional
	  }
  }

  use "mfussenegger/nvim-lint"
  -- lsp-colors 
  use 'folke/lsp-colors.nvim'

  -- keeps undo across everything
  use "mbbill/undotree"

  -- in-line diagnostics
  use {
      "folke/trouble.nvim",
      requires = "nvim-tree/nvim-web-devicons",
      config = function()
          require("trouble").setup {}
      end
  }

  -- statusline
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }


  -- debugger
  use {
	  'mfussenegger/nvim-dap-python',
	  requires = {'mfussenegger/nvim-dap'},
	  config = function()
		  require'dap-python'.setup('~/.config/nvim/.virtualenvs/debugpy/bin/python')
		  require'dap-python'.test_runner = 'pytest'
	  end
  }
end)
