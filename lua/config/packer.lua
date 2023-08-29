local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  use('wbthomason/packer.nvim')

  -- Appearance
  use({
    'sainnhe/sonokai',
    config = function()
      vim.cmd('syntax enable')
      vim.opt.background = 'dark'
      vim.g.sonokai_style = 'atlantis'
      vim.g.sonokai_better_performance = 1
      vim.g.sonokai_enable_italic = 0
      vim.cmd('colorscheme sonokai')
    end,
  })
  use('hoob3rt/lualine.nvim')

  -- LSP
  use('neovim/nvim-lspconfig')
  use('hrsh7th/nvim-compe')
  use('ray-x/lsp_signature.nvim')

  -- Searching
  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
    },
  })

  -- Project management
  use('tpope/vim-fugitive')
  use('lewis6991/gitsigns.nvim')

  -- Editing
  use('numToStr/Comment.nvim')
  use('tpope/vim-surround')
  use('tpope/vim-repeat')
  use('windwp/nvim-autopairs')
  use('SirVer/ultisnips')

  -- Miscellaneous utilities
  use({
    'tpope/vim-dispatch',
    opt = true,
    cmd = {'Make', 'Dispatch'},
  })
  use({
    'nathom/filetype.nvim',
    setup = function()
      vim.g.did_load_filetypes = 1
    end,
  })

  if packer_bootstrap then
    require('packer').sync()
  end
end)

if vim.fn.exists('g:loaded_matchit') == 0 then
  vim.cmd('runtime! macros/matchit.vim')
end
