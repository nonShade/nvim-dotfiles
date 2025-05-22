return {
  "stevearc/oil.nvim",
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    require("oil").setup({
      default_file_explorer = true, -- start up nvim with oil instead of netrw
      columns = { "icon" },
      keymaps = {
        ["<C-h>"] = false,
        ["<C-c>"] = false,
        ["<M-h>"] = "actions.select_split",
        ["q"] = "actions.close",
      },
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
      skip_confirm_for_simple_edits = true,
    })

    -- keymaps for oil
    vim.keymap.set("n", "<leader>e", require("oil").toggle_float, { desc = "Open parent directory" }) -- opens parent dir over current active window
    vim.keymap.set("n", "<leader>E", "<CMD>Oil<CR>", { desc = "Open parent directory" })              -- opens parent dir over current active window

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "oil",
      callback = function()
        vim.opt_local.cursorline = true
      end,
    })
  end
}
