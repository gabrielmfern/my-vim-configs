vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- packer itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'nvim-tree/nvim-web-devicons'

  -- plugins to make things prettier
  use 'RRethy/nvim-base16'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'NvChad/nvim-colorizer.lua'
  use 'nvim-treesitter/nvim-tree-docs'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'p00f/nvim-ts-rainbow'
  use 'petRUShka/vim-opencl'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  -- some cool stuff that helps me out
  use 'windwp/nvim-autopairs'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'xolox/vim-misc'
  use 'matze/vim-move'
  use 'gpanders/editorconfig.nvim'
  use({
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    setup = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  })

  -- file tree plugin
  use({
    'ms-jpq/chadtree',
    branch = 'chad',
    run = 'python3 -m chadtree deps',
  })

  -- some git plugins
  use 'lewis6991/gitsigns.nvim'
  use 'kdheepak/lazygit.nvim'
  use 'f-person/git-blame.nvim'

  -- the cherry on the top: LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }
end)
