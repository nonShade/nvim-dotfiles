local set = vim.opt_local

set.textwidth = 80 -- Wrap text at 80 characters
set.spell = true   -- Enable spell checking
set.linebreak = true

-- Colores tomados desde tu paleta base16
local color_fg = "#1c1c2e" -- fondo oscuro para contraste con los highlights

-- Puedes usar directamente estos de tu paleta
local color1_bg = "#ec5f67" -- rojo suave
local color2_bg = "#99c794" -- verde
local color3_bg = "#fac863" -- amarillo
local color4_bg = "#6699cc" -- azul
local color5_bg = "#c594c5" -- violeta
local color6_bg = "#5fb3b3" -- cian

vim.cmd(
  string.format([[highlight @markup.heading.1.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color1_bg)
)
vim.cmd(
  string.format([[highlight @markup.heading.2.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color2_bg)
)
vim.cmd(
  string.format([[highlight @markup.heading.3.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color3_bg)
)
vim.cmd(
  string.format([[highlight @markup.heading.4.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color4_bg)
)
vim.cmd(
  string.format([[highlight @markup.heading.5.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color5_bg)
)
vim.cmd(
  string.format([[highlight @markup.heading.6.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color6_bg)
)
