local prompts = {
  Explain = "Please explain how the following code works.",                                                                                                                                        -- Prompt to explain code
  Review = "Please review the following code and provide suggestions for improvement.",                                                                                                            -- Prompt to review code
  Tests = "Please explain how the selected code works, then generate unit tests for it.",                                                                                                          -- Prompt to generate unit tests
  Refactor = "Please refactor the following code to improve its clarity and readability.",                                                                                                         -- Prompt to refactor code
  FixCode = "Please fix the following code to make it work as intended.",                                                                                                                          -- Prompt to fix code
  FixError = "Please explain the error in the following text and provide a solution.",                                                                                                             -- Prompt to fix errors
  BetterNamings = "Please provide better names for the following variables and functions.",                                                                                                        -- Prompt to suggest better names
  Documentation = "Please provide documentation for the following code.",                                                                                                                          -- Prompt to generate documentation
  JsDocs = "Please provide JsDocs for the following code.",                                                                                                                                        -- Prompt to generate JsDocs
  DocumentationForGithub = "Please provide documentation for the following code ready for GitHub using markdown.",                                                                                 -- Prompt to generate GitHub documentation
  CreateAPost =
  "Please provide documentation for the following code to post it in social media, like Linkedin, it has be deep, well explained and easy to understand. Also do it in a fun and engaging way.",   -- Prompt to create a social media post
  SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",                                                                                                            -- Prompt to generate Swagger API docs
  SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",                                                                                                                       -- Prompt to generate Swagger JsDocs
  Summarize = "Please summarize the following text.",                                                                                                                                              -- Prompt to summarize text
  Spelling = "Please correct any grammar and spelling errors in the following text.",                                                                                                              -- Prompt to correct spelling and grammar
  Wording = "Please improve the grammar and wording of the following text.",                                                                                                                       -- Prompt to improve wording
  Concise = "Please rewrite the following text to make it more concise.",                                                                                                                          -- Prompt to make text concise
}

-- Define mappings for CopilotChat
local function setup_copilot_chat_mappings()
  -- Mapping to open CopilotChat
  vim.api.nvim_set_keymap('n', '<leader>ga', ':CopilotChatToggle<CR>', { noremap = true, silent = true })
end

-- Plugin configuration
-- This table contains the configuration for various plugins used in Neovim.
return {

  -- Copilot Chat plugin configuration
  {
    "CopilotC-Nvim/CopilotChat.nvim",     -- Load the Copilot Chat plugin
    opts = {
      prompts = prompts,
      system_prompt =
      "soy un programador junior de la universidad de la frontera, chile, llamado Shade y actualmente trabajo mayoritariamente con Vue en el frontend. quiero que mi código cumpla con todas las buenas prácticas, siguiendo principios como la separación de preocupaciones, la modularización y la arquitectura limpia. también me interesa aprender más sobre patrones de diseño como el composition/presentational y cómo aplicarlos en Vue. quiero que la inteligencia artificial hable con un estilo profesional pero cercano, usando expresiones chilenas relajadas, sin signos de exclamación al inicio ni mayúsculas en la primera letra. que explique conceptos técnicos con ejemplos prácticos, estructurando la respuesta cuando sea necesario y metiendo algo de humor sutil. dale que va. y cuando pongas código de respuesta, no agregues las líneas de código a las que pertenecen, y cualquier comentario que agregues al código hazlo en inglés.",
      model = "claude-3.7-sonnet",
      answer_header = "-  Shade -  ",
      window = {
        layout = "float",
      },
    },
    config = function(_, opts)
      require("CopilotChat").setup(opts)
      setup_copilot_chat_mappings()
    end,
  },
}
