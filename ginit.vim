" Enable mouse only in normal and visual mode
set mouse=nv

" Font
if exists(':GuiFont')
  GuiFont! Iosevka:h11
endif

" Disable GUI popupmenu
if exists(':GuiPopupmenu')
  GuiPopupmenu 0
endif

" Disable GUI tabline
if exists(':GuiTabline')
  GuiTabline 0
endif
