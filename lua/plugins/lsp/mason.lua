return {
    "williamboman/mason.nvim",
    lazy = false,
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "neovim/nvim-lspconfig",
    },
    config = function()
        -- import mason and mason_lspconfig
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        -- NOTE: Moved from lspconfig.lua
        -- import lspconfig plugin
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")         -- import cmp-nvim-lsp plugin
        local capabilities = cmp_nvim_lsp.default_capabilities() -- used to enable autocompletion (assign to every lsp server config)

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            -- servers for mason to install
            ensure_installed = {
                "js-debug-adapter",
                "lua_ls",
                "ts_ls",
                "html",
                "cssls",
            },
            -- auto install configured servers (with lspconfig)
            automatic_installation = true,
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "prettier", -- prettier formatter
                "stylua", -- lua formatter
            },
        })

        -- NOTE: Moved from lspconfig.lua
        --
        mason_lspconfig.setup_handlers({
            -- default handler for installed servers
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,
            ["lua_ls"] = function()
                -- configure lua server (with special settings)
                lspconfig["lua_ls"].setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            -- make the language server recognize "vim" global
                            diagnostics = {
                                globals = { "vim" },
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                            workspace = {
                                -- make language server aware of run time files
                                library = {
                                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                    [vim.fn.stdpath("config") .. "/lua"] = true,
                                },
                            },
                        },
                    },
                })
            end,
            ["ts_ls"] = function()
                lspconfig.ts_ls.setup({
                    capabilities = capabilities,
                    on_attach = function(client, bufnr)
                        -- Disable formatting if you're using a separate formatter like Prettier
                        -- client.server_capabilities.documentFormattingProvider = false
                    end,
                    init_options = {
                        preferences = {
                            includeCompletionsWithSnippetText = true,
                            includeCompletionsForImportStatements = true,
                        },
                    },
                })
            end,
        })
    end,
}
