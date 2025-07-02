return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  enabled = true,
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick",  -- for file_selector provider mini.pick
    "echasnovski/mini.icons", -- for icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
  },
  keys = {
    { "<leader>aa", "<cmd>Avante ask", desc = "Avante Ask" },
  },
  opts = {
    provider = "copilot",
    file_selector = {
      provider = "snacks",
    },
    -- behaviour = {
    --   enable_claude_text_editor_tool_mode = true,
    -- },
    -- custom_tools = require("custom.avante.tools"),
    -- system_prompt as function ensures LLM always has latest MCP server state
    -- This is evaluated for every message, even in existing chats
    -- system_prompt = function()
    --   local hub = require("mcphub").get_hub_instance()
    --   return hub and hub:get_active_servers_prompt() or ""
    -- end,
    -- -- Using function prevents requiring mcphub before it's loaded
    -- custom_tools = function()
    --   return {
    --     require("mcphub.extensions.avante").mcp_tool(),
    --   }
    -- end,
    --
    -- disabled_tools = {
    --   "create_file",
    --   "rename_file",
    --   "delete_file",
    --   "create_dir",
    --   "rename_dir",
    --   "delete_dir",
    --   "bash", -- Built-in terminal access
    -- },
  },
}
