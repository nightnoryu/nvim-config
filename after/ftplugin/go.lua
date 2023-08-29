vim.opt_local.expandtab = false
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

local go_format = vim.api.nvim_create_augroup('go_format', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', {
  group = go_format,
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.format()
  end,
})
