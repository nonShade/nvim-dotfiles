return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      styles = {
        snacks_image = {
          relative = "editor",
          col = -1,
        },
      },
      image = {
        enabled = true,
        doc = {
          inline = vim.g.neovim_mode == "skitty" and true or false,
          float = true,
          max_width = vim.g.neovim_mode == "skitty" and 20 or 60,
          max_height = vim.g.neovim_mode == "skitty" and 10 or 30,
        }
      },
      explorer = {
        enabled = false, -- Deshabilitar el explorer
      },
      quickfile = {
        enabled = false, -- Deshabilitar quickfile
      },
      picker = {
        enabled = true,
        formatters = {
          file = {
            filename_first = false,
            filename_only = false,
            icon_width = 2,
          },
        },
        layout = {
          preset = "ivy", -- Usar el layout de telescope
          cycle = false,
        },
        layouts = {
          telescope = {
            reverse = true, -- Barra de búsqueda en la parte inferior
            layout = {
              box = "horizontal",
              backdrop = false,
              width = 0.8,
              height = 0.9,
              border = "none",
              {
                box = "vertical",
                { win = "list",  title = " Results ", title_pos = "center", border = "rounded" },
                { win = "input", height = 1,          border = "rounded",   title = "{title} {live} {flags}", title_pos = "center" },
              },
              {
                win = "preview",
                title = "{preview:Preview}",
                width = 0.50,
                border = "rounded",
                title_pos = "center",
              },
            },
          },
          ivy = {
            layout = {
              box = "vertical",
              backdrop = false,
              width = 0,
              height = 0.4,
              position = "bottom",
              border = "top",
              title = " {title} {live} {flags}",
              title_pos = "left",
              { win = "input", height = 1, border = "bottom" },
              {
                box = "horizontal",
                { win = "list",    border = "none" },
                { win = "preview", title = "{preview}", width = 0.5, border = "left" },
              },
            },
          },
        },
      },
    },
    keys = {
      -- Snacks Picker
      { "<leader><space>", function() Snacks.picker.smart() end,                                     desc = "Smart Find Files" },
      { "<leader>pk",      function() require("snacks").picker.keymaps({ layout = "ivy" }) end,      desc = "Search Keymaps (Snacks Picker)" },
      { "<leader>lg",      function() require("snacks").lazygit() end,                               desc = "Lazygit" },
      { "<leader>gl",      function() require("snacks").lazygit.log() end,                           desc = "Lazygit Logs" },

      -- Other Utils
      { "<leader>th",      function() require("snacks").picker.colorschemes({ layout = "ivy" }) end, desc = "Pick Color Schemes" },
      { "<leader>vh",      function() require("snacks").picker.help() end,                           desc = "Help Pages" },
    }
  },
}
