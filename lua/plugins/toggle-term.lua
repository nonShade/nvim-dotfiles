return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return math.floor(vim.o.columns * 0.4)
        end
      end,
      -- Mapeo personalizado para mejor control
      open_mapping = false, -- Desactivamos el mapeo automático para implementar nuestro propio toggle
      shading_factor = 2,
      shade_terminals = true,
      persist_size = true,
      direction = "float",
      float_opts = {
        border = "rounded",
        width = math.floor(vim.o.columns * 0.8),
        height = math.floor(vim.o.lines * 0.8),
      },
      -- Nueva configuración para manejar cierres
      on_close = function(term)
        vim.schedule(function()
          if vim.api.nvim_buf_is_valid(term.bufnr) then
            vim.api.nvim_buf_delete(term.bufnr, { force = true })
          end
        end)
      end,
    })

    -- Toggle personalizado con limpieza garantizada
    local Terminal = require("toggleterm.terminal").Terminal

    function _G.__toggle_terminal()
      local term = Terminal:new({ direction = "float" })
      if term:is_open() then
        term:close()
        -- Limpieza forzada de buffers
        vim.schedule(function()
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_get_option_value(buf, "buftype") == "terminal" then
              vim.api.nvim_buf_delete(buf, { force = true })
            end
          end
        end)
      else
        term:open()
      end
    end

    vim.keymap.set("n", "<leader>n", "<cmd>lua __toggle_terminal()<CR>",
      { noremap = true, silent = true, desc = "Toggle terminal flotante" })
    vim.keymap.set("t", "<Esc>", [[<C-\><C-n><cmd>close<CR>]],
      { noremap = true, silent = true, desc = "Cerrar terminal" })
  end
}
