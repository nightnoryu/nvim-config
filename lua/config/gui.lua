-- Set the window's title to the current filename
vim.opt.title = true
vim.opt.titlestring = '%{expand(\'%:t\')}'

local gui = vim.api.nvim_create_augroup('gui', { clear = true })

vim.api.nvim_create_autocmd('UIEnter', {
  group = gui,
  once = true,
  callback = function()
    vim.opt.mouse = 'nv'

    if vim.fn.exists(':GuiFont') ~= 0 then
      vim.cmd [[GuiFont! Iosevka:h11]]
    end

    if vim.fn.exists(':GuiPopupmenu') ~= 0 then
      vim.cmd [[GuiPopupmenu 0]]
    end

    if vim.fn.exists(':GuiTabline') ~= 0 then
      vim.cmd [[GuiTabline 0]]
    end
  end,
})
