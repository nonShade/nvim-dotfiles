-- NOTE : Plugin para poder usar jupyter notebooks
return {
  "hkupty/iron.nvim",
  config = function()
    local iron = require("iron.core")
    local view = require("iron.view")

    iron.setup({
      config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
          python = {
            command = { "ipython", "--no-autoindent" }, -- Cambiado a IPython
          },
          sh = {
            -- Can be a table or a function that
            -- returns a table (see below)
            command = { "zsh" },
          },
        },
        -- How the repl window will be displayed
        -- See below for more information
        repl_open_cmd = view.split.vertical("50%"),
      },
      -- Iron doesn't set keymaps by default anymore.
      -- You can set them here or manually add keymaps to the functions in iron.core
      keymaps = {
        send_motion = "<leader>jc",
        visual_send = "<leader>jc",
        send_file = "<leader>jf",
        send_line = "<leader>jl",
        send_paragraph = "<leader>jp",
        send_until_cursor = "<leader>ju",
        send_mark = "<leader>jm",
        send_code_block = "<leader>jb",
        send_code_block_and_move = "<leader>jn",
        mark_motion = "<leader>jmc",
        mark_visual = "<leader>jmc",
        remove_mark = "<leader>jmd",
        cr = "<leader>js<cr>",
        interrupt = "<leader>js<space>",
        exit = "<leader>jq",
        clear = "<leader>jcl",
      },
      -- If the highlight is on, you can change how it looks
      -- For the available options, check nvim_set_hl
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
    })

    -- iron also has a list of commands, see :h iron-commands for all available commands
    vim.keymap.set("n", "<space>rs", "<cmd>IronRepl<cr>")
    vim.keymap.set("n", "<space>rr", "<cmd>IronRestart<cr>")
    vim.keymap.set("n", "<space>rf", "<cmd>IronFocus<cr>")
    vim.keymap.set("n", "<space>rh", "<cmd>IronHide<cr>")
    vim.keymap.set("n", "<leader>jcc", "o# %%<CR>", { desc = "Crear celda en IPython" })

    vim.keymap.set("n", "<leader>jec", function()
      require("iron.core").send("python", "%run " .. vim.fn.expand("%:p") .. "\n")
    end, { desc = "Ejecutar celda en IPython" })
  end,
}
