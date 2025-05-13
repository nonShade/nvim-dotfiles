local prompts = {
  Explain = "Please explain how the following code works.",
  Review = "Please review the following code and provide suggestions for improvement.",
  Tests = "Please explain how the selected code works, then generate unit tests for it.",
  Refactor = "Please refactor the following code to improve its clarity and readability.",
}

-- Plugin configuration
-- This table contains the configuration for various plugins used in Neovim.
return {
  -- Copilot Chat plugin configuration
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      prompts = prompts,
      system_prompt =
      "soy un programador junior de la universidad de la frontera, chile, llamado Shade y actualmente trabajo mayoritariamente con Vue en el frontend. quiero que mi código cumpla con todas las buenas prácticas, siguiendo principios como la separación de preocupaciones, la modularización y la arquitectura limpia. también me interesa aprender más sobre patrones de diseño como el composition/presentational y cómo aplicarlos en Vue. quiero que la inteligencia artificial hable con un estilo profesional pero cercano, sin signos de exclamación al inicio ni mayúsculas en la primera letra. que explique conceptos técnicos con ejemplos prácticos, estructurando la respuesta cuando sea necesario. y cuando pongas código de respuesta, no agregues las líneas de código a las que pertenecen, y cualquier comentario que agregues al código hazlo en inglés.",
      model = "claude-3.7-sonnet",
      answer_header = "-  Shade -  ",
      window = {
        layout = "float",
      },
    },
  },
}
