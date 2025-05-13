---@type vim.lsp.Config
return {
  filetypes = { "vue" },
  init_options = {
    config = {
      vetur = {
        useWorkspaceDependencies = true,
        validation = { template = true, script = true, style = true },
        completion = {
          autoImport = true,
          tagCasing = "kebab",
          useScaffoldSnippets = true
        }
      }
    }
  }
}
