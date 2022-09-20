vim.opt_local.expandtab = false
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

local group = vim.api.nvim_create_augroup('group', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', {
  group = group,
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.formatting()
  end,
})
