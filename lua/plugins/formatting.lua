return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                vue = { "prettier" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                lua = { "stylua" },
            },
        })

        -- Configure individual formatters
        conform.formatters.prettier = {
            args = {
                "--stdin-filepath",
                "$FILENAME",
                "--tab-width",
                "4",
                "--use-tabs",
                "false",
            },
        }
        conform.formatters.shfmt = {
            prepend_args = { "-i", "4" },
        }

        -- Define un comando que guarde todos los archivos sin formatear
        vim.api.nvim_create_user_command("WNoFormat", function()
            vim.cmd("noautocmd wa") -- Guarda sin activar eventos automáticos
        end, { desc = "Guardar todos los archivos sin activar formateo automático" })

        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = " Prettier Format whole file or range (in visual mode) with" })
    end,
}
