--
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})

  -- Ref: https://github.com/wbthomason/packer.nvim/issues/739#issuecomment-1019280631
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- web icons.used by many plugins
  use 'nvim-tree/nvim-web-devicons'

  -- Treesitter and friends
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use ('nvim-treesitter/nvim-treesitter-context')

  -- Shinanigans
  use('ThePrimeagen/vim-be-good')

  -- autosession is used for saving and restoring vim sessions
  use {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
      }
    end
  }

  -- saves a db of all yanks
  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      {'kkharji/sqlite.lua', module = 'sqlite'},
      {'nvim-telescope/telescope.nvim'},
    },
    config = function()
      require('neoclip').setup()
    end,
  }

  -- auto save. will configure to work only in markdown
  -- use('Pocco81/auto-save.nvim')

  -- Obsdian plugin for nvim
  use('epwalsh/obsidian.nvim')
  use('godlygeek/tabular') -- needed by vim-markdown
  use('preservim/vim-markdown') -- recommended for syntax highlighting, folding, etc if you're not 
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Quality of life
  -- use('github/copilot.vim')
  use{
    "madox2/vim-ai",
    -- run = "./install.sh"
    branch = 'next'
  }
  -- use ("zbirenbaum/copilot.lua")
  -- use {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function ()
  --   --   require("copilot_cmp").setup()
  --     require("copilot_cmp").setup({
  --       formatters = {
  --         label = require("copilot_cmp.format").format_label_text,
  --         -- insert_text = require("copilot_cmp.format").format_insert_text,
  --         insert_text = require("copilot_cmp.format").remove_existing,
  --         preview = require("copilot_cmp.format").deindent,
  --       },
  --     })
  --   end
  -- }
  use {
    'rmagatti/session-lens',
    requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
    config = function()
      require('session-lens').setup({--[[your custom config--]]})
    end
  }
  use('tpope/vim-commentary')
  use('mbbill/undotree')
  use {

    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- use {
  --   'm-memare/hlargs.nvim',
  --   requires = { 'nvim-treesitter/nvim-treesitter' }
  -- }
  use({
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    after = "nvim-web-devicons", -- keep this if you're using NvChad
    config = function()
      require("barbecue").setup()
    end,
  })

  use("szw/vim-maximizer") -- maximizes and restores current window

  -- git integration
  use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- LSP and Autocompletion
  -- use('tpope/vim-liquid')
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  }) -- enhanced lsp uis
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

  -- adds line under the cursor word and much more in this little package
  use ('echasnovski/mini.nvim')

    -- Navigation
  use('nvim-treesitter/playground')
  use('thePrimeagen/harpoon')
  use('ggandor/lightspeed.nvim')
  use('chentoast/marks.nvim')
  use('tpope/vim-fugitive')
  use('tpope/vim-surround')
  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- Beautify
  use { "catppuccin/nvim", as = "catppuccin" }
  use "lukas-reineke/indent-blankline.nvim"
  use('xiyaowong/nvim-transparent')

end)

