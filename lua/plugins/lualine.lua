return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      bg       = "#1F1F28", -- fondo general
      fg       = "#d8dee9", -- texto principal
      normal   = "#b4befe", -- azul pastel
      insert   = "#a6e3a1", -- verde suave
      visual   = "#f5c2e7", -- rosado pastel
      replace  = "#f38ba8", -- rojo coral
      inactive = "#585b70", -- gris violeta
      border   = "#313244", -- separadores
    }

    local my_lualine_theme = {
      normal = {
        a = { fg = colors.bg, bg = colors.normal, gui = "bold" },
        b = { fg = colors.fg, bg = colors.border },
        c = { fg = colors.fg, bg = colors.bg },
      },
      insert = {
        a = { fg = colors.bg, bg = colors.insert, gui = "bold" },
        b = { fg = colors.fg, bg = colors.border },
        c = { fg = colors.fg, bg = colors.bg },
      },
      visual = {
        a = { fg = colors.bg, bg = colors.visual, gui = "bold" },
        b = { fg = colors.fg, bg = colors.border },
        c = { fg = colors.fg, bg = colors.bg },
      },
      replace = {
        a = { fg = colors.bg, bg = colors.replace, gui = "bold" },
        b = { fg = colors.fg, bg = colors.border },
        c = { fg = colors.fg, bg = colors.bg },
      },
      inactive = {
        a = { fg = colors.fg, bg = colors.inactive, gui = "bold" },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
      },
    }

    local mode = {
      'mode',
      fmt = function(str)
        -- return ' '
        -- displays only the first character of the mode
        return ' ' .. str
      end,
    }

    local diff = {
      'diff',
      colored = true,
      symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
      -- cond = hide_in_width,
    }

    local filename = {
      'filename',
      file_status = true,
      path = 0,
    }

    local branch = { 'branch', icon = { '', color = { fg = '#A6D4DE' } }, '|' }


    lualine.setup({
      icons_enabled = true,
      options = {
        theme = my_lualine_theme,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "|", right = "" },
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { branch },
        lualine_c = { diff, filename },
        lualine_x = {
          {
            -- require("noice").api.statusline.mode.get,
            -- cond = require("noice").api.statusline.mode.has,
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          -- { "encoding",},
          -- { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
