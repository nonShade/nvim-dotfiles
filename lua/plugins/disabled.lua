return {
  { "rafamadriz/friendly-snippets",             enabled = false },
  { "stevearc/conform.nvim",                    enabled = false },
  { "ibhagwan/fzf-lua",                         enabled = false },
  { "akinsho/bufferline.nvim",                  enabled = false },
  { "nvim-telescope/telescope.nvim",            enabled = false },
  { "nvim-telescope/telescope-fzf-native.nvim", enabled = false },
  { "ngtuonghy/live-server-nvim",               enabled = false },
  { "CopilotC-Nvim/CopilotChat.nvim",           enabled = true, },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = true,
    opts = {
      window = {
        position = "right", -- Posición de la barra lateral (derecha)
        width = 30,         -- Ancho de la barra lateral
      },
      filesystem = {
        filtered_items = {
          visible = true,          -- Mostrar archivos ocultos
          hide_dotfiles = false,   -- No ocultar archivos que comienzan con "."
          hide_gitignored = false, -- No ocultar archivos ignorados por Git
        },
      },
      event_handlers = {
        -- Cerrar Neo-tree al abrir un archivo
        {
          event = "file_opened",
          handler = function()
            require("neo-tree").close_all()
          end,
        },
      },
    },
  }
}
