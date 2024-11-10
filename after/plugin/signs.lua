require 'gitsigns'.setup {
  signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '-' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, lhs, rhs, opts)
      opts = vim.tbl_extend('force', { noremap = true, silent = true }, opts or {})
      vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    -- Navigation
    map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr=true })
    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr=true })

    -- Actions
    map('n', '<leader>gs', ':Gitsigns stage_hunk<CR>')
    map('v', '<leader>gs', ':Gitsigns stage_hunk<CR>')
    map('n', '<leader>gu', ':Gitsigns reset_hunk<CR>')
    map('v', '<leader>gu', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>gp', '<cmd>Gitsigns preview_hunk<CR>')
    map('n', '<leader>gd', '<cmd>Gitsigns diffthis<CR>')
    map('n', '<leader>gb', '<cmd>lua require "gitsigns".blame_line{ full=true }<CR>')

    -- Text object
    map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
