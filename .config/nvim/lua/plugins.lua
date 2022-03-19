return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'nvim-lua/lsp-status.nvim'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use 'nathom/filetype.nvim'

  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim'
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }

  use 'Mofiqul/dracula.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'ibhagwan/fzf-lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'editorconfig/editorconfig-vim'
  use 'mattn/emmet-vim'
  use 'tpope/vim-surround'
  use 'terryma/vim-multiple-cursors'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'prettier/vim-prettier',
    run = 'yarn install'
  }
end)
