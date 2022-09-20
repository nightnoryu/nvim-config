vim.opt.mouse = 'nv'

if vim.fn.exists(':GuiFont') == 1 then
  vim.cmd [[GuiFont! Iosevka:h11]]
end

if vim.fn.exists(':GuiPopupmenu') == 1 then
  vim.cmd [[GuiPopupmenu 0]]
end

if vim.fn.exists(':GuiTabline') == 1 then
  vim.cmd [[GuiTabline 0]]
end
