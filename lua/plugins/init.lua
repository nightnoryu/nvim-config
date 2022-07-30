local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

require 'packer'.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Appearance
  use 'sainnhe/sonokai'
  use { 'hoob3rt/lualine.nvim', config = [[require 'plugins.statusline']] }
  use 'mhinz/vim-startify'

  -- LSP
  use { 'neovim/nvim-lspconfig', config = [[require 'plugins.lsp']] }
  use { 'hrsh7th/nvim-compe', config = [[require 'plugins.completion']] }
  use 'ray-x/lsp_signature.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = [[require 'plugins.treesitter']] }

  -- Searching
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
    },
    config = [[require 'plugins.telescope']]
  }

  -- Project management
  use 'tpope/vim-fugitive'
  use { 'lewis6991/gitsigns.nvim', config = [[require 'plugins.signs']] }
  use { 'junegunn/gv.vim', opt = true, cmd = 'GV' }
  use { 'preservim/nerdtree', opt = true, cmd = {'NERDTree', 'NERDTreeToggle', 'NERDTreeFind'} }

  -- Editing
  use { 'numToStr/Comment.nvim', config = [[require 'plugins.comments']] }
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'wellle/targets.vim'
  use { 'windwp/nvim-autopairs', config = [[require 'plugins.autopairs']] }
  use 'SirVer/ultisnips'

  -- Miscellaneous utilities
  use { 'tpope/vim-dispatch', opt = true, cmd = {'Make', 'Dispatch'} }
  use { 'junegunn/vim-easy-align', opt = true, cmd = {'EasyAlign', 'LiveEasyAlign'} }
  use 'nathom/filetype.nvim'

  if packer_bootstrap then
    require 'packer'.sync()
  end
end)
