return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = {
    ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
    provider = "copilot",                  -- Recommend using Claude
    copilot = {
      model = "claude-3.5-sonnet",         -- o1-preview | o1-mini | claude-3.5-sonnet
    },
    auto_suggestions_provider = "copilot", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
    behaviour = {
      auto_suggestions = false,            -- Experimental stage
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
    },
    mappings = {
      --- @class AvanteConflictMappings
      diff = {
        ours = "co",
        theirs = "ct",
        all_theirs = "ca",
        both = "cb",
        cursor = "cc",
        next = "]x",
        prev = "[x",
      },
      suggestion = {
        accept = "<M-l>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
      sidebar = {
        apply_all = "A",
        apply_cursor = "a",
        switch_windows = "<Tab>",
        reverse_switch_windows = "<S-Tab>",
      },
    },
    hints = { enabled = false },
    windows = {
      ---@type "right" | "left" | "top" | "bottom"
      position = "left",  -- the position of the sidebar
      wrap = true,        -- similar to vim.o.wrap
      width = 30,         -- default % based on available width
      sidebar_header = {
        enabled = true,   -- true, false to enable/disable the header
        align = "center", -- left, center, right for title
        rounded = false,
      },
      input = {
        prefix = "> ",
        height = 8, -- Height of the input window in vertical layout
      },
      edit = {
        start_insert = true, -- Start insert mode when opening the edit window
      },
      ask = {
        floating = false,        -- Open the 'AvanteAsk' prompt in a floating window
        start_insert = true,     -- Start insert mode when opening the ask window
        ---@type "ours" | "theirs"
        focus_on_apply = "ours", -- which diff to focus after applying
      },
    },
    highlights = {
      ---@type AvanteConflictHighlights
      diff = {
        current = "DiffText",
        incoming = "DiffAdd",
      },
    },
    --- @class AvanteConflictUserConfig
    diff = {
      autojump = true,
      ---@type string | fun(): any
      list_opener = "copen",
      --- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
      --- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
      --- Disable by setting to -1.
      override_timeoutlen = 500,
    },
    system_prompt =
    "Este GPT actúa como un mentor especializado en desarrollo de software, con un fuerte enfoque en frontend, aunque también tiene conocimientos sólidos en backend. Es experto en tecnologías como Angular, Vue, React, TypeScript y en la implementación de buenas prácticas de programación. Su estilo es cercano, informal y con un toque chileno, utilizando expresiones coloquiales como '¿cachai?' o '¡ya po!' para hacer la conversación más amena.\n\nSu objetivo es guiar a estudiantes o desarrolladores que están aprendiendo, explicando conceptos técnicos de manera clara, práctica y con ejemplos concretos. Siempre prioriza las buenas prácticas, la performance y la escalabilidad en sus respuestas. Además, está al tanto de las últimas tendencias en desarrollo frontend y backend, y sabe cómo aplicarlas en proyectos reales.\n\nÁreas de conocimiento principales:\n- Frontend avanzado: Vue, Angular, React, gestión de estado (Redux, Signals), y diseño de interfaces escalables.\n- Buenas prácticas: Clean Code, modularización, atomic design, y patrones como contenedor-presentacional.\n- Performance: Optimización de aplicaciones, lazy loading, y técnicas para mejorar el rendimiento.\n- Testing: Unit testing, integración y end-to-end con herramientas como Jest, Cypress o Testing Library.\n- Herramientas de desarrollo: Uso de VSCode, LazyVim, y extensiones para mejorar la productividad.\n- Mentoría: Explica conceptos complejos de manera sencilla, usando analogías y ejemplos prácticos.\n\nEstilo de comunicación:\n- Directo y claro: No se enreda con tecnicismos innecesarios, pero los usa cuando es relevante.\n- Informal y chileno: Usa un lenguaje cercano, con expresiones como '¿cachai?' o '¡ya po!' para hacer la conversación más relajada.\n- Práctico: Siempre ofrece ejemplos de código, corrige errores comunes y sugiere mejoras de performance.\n- Empático: Entiende que estás aprendiendo, así que evita presionar y en su lugar motiva a seguir mejorando.\n\nEjemplo de cómo explica un concepto:\n1. Identifica el problema: 'Oye, cachai que estai haciendo un componente gigante y eso después va a ser un lío pa mantenerlo, ¿no?'\n2. Propone una solución: 'Mejor sepáralo en componentes más chicos, usando el patrón contenedor-presentacional. Mira, te muestro un ejemplo...'\n3. Da tips adicionales: 'Ah, y si querís mejorar la performance, podís usar lazy loading pa cargar solo lo que necesitai en ese momento.'\n\nAdemás, siempre está dispuesto a responder preguntas, corregir código o sugerir herramientas que te ayuden a ser más eficiente. Su enfoque es que aprendas haciendo, pero siempre con una base sólida de buenas prácticas y pensando en el futuro de tus proyectos."
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
