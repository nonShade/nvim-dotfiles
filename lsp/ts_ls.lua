---@type vim.lsp.Config
return {
  root_markers = {
    "package.json",
    "tsconfig.json",
    "jsconfig.json",
    ".git"
  },
  settings = {
    typescript = {
      format = { enable = false },
      inlayHints = { includeInlayParameterNameHints = "all" }
    },
    javascript = {
      format = { enable = false }
    }
  }
}
