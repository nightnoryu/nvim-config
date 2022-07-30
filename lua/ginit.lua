vim.opt.mouse = 'nv'

if vim.fn.exists(':GuiFont') then
  vim.cmd [[GuiFont! Iosevka:h11]]
end

if vim.fn.exists(':GuiPopupmenu') then
  vim.cmd [[GuiPopupmenu 0]]
end

if vim.fn.exists(':GuiTabline') then
  vim.cmd [[GuiTabline 0]]
end
