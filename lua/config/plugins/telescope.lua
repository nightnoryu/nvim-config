local telescope = require 'telescope'
local actions = require 'telescope.actions'
local sorters = require 'telescope.sorters'
local previewers = require 'telescope.previewers'

local noremaps = require 'config.utils'.noremaps

telescope.setup {
  defaults = {
    file_sorter = sorters.get_fzy_sorter,
    prompt_prefix = '$ ',

    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,

    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
      '-g', '!.git',
      '-g', '!yarn.lock',
    },

    layout_config = {
      prompt_position = 'bottom',
      horizontal = {
        width_padding = 0.04,
        height_padding = 0.1,
        preview_width = 0.6,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      },
    },

    mappings = {
      i = {
        ['<C-x>'] = false,
        ['<C-s>'] = actions.select_horizontal,
      },
    },

    file_ignore_patterns = { '%.git/', 'node_modules/', '__pycache__/', '%.idea/', 'var/', 'vendor/' },
  },

  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    },
  },
}
telescope.load_extension 'fzy_native'

noremaps('n', '<C-p>', '<cmd>Telescope find_files<CR>', opts)
noremaps('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)
noremaps('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)
noremaps('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', opts)
noremaps('n', '<leader>gb', '<cmd>Telescope git_branches<CR>', opts)
