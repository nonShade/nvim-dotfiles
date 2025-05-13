---@type vim.lsp.Config
local util = require("lspconfig.util")

return {
  cmd = {
    "node",
    "node_modules/@vue/language-server/bin/vue-language-server.js",
    "--stdio",
  },
  filetypes = { "vue" },
  root_dir = util.root_pattern("package.json", "vue.config.js", ".git"),
  single_file_support = false,
}
