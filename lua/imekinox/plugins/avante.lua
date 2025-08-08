return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- set to "*" to use latest release (not recommended)
  build = "make", -- This is optional, only if you want to use the binary
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "stevearc/dressing.nvim", -- for input provider dressing
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
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
  config = function()
    require("avante").setup({
      -- Default provider
      provider = "claude", -- Recommend using Claude
      
      -- Auto suggestions provider
      auto_suggestions_provider = "claude", -- Since you don't have copilot active
      
      -- Mode: "agentic" for modern tool-based interaction or "legacy" for older planning method
      mode = "agentic",
      
      -- Input provider configuration
      input_provider = "dressing", -- Use dressing.nvim for better input handling
      
      -- Disable copilot entirely
      copilot = {
        enabled = false,
      },
      
      -- Provider configurations
      providers = {
        claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-3-5-sonnet-20241022", -- Claude 3.5 Sonnet - Latest available model
          timeout = 30000, -- Timeout in milliseconds
          api_key_name = "ANTHROPIC_API_KEY", -- Environment variable name
          extra_request_body = {
            temperature = 0,
            max_tokens = 4096,
          },
        },
        copilot = {
          enabled = false, -- Explicitly disable Copilot provider
        },
      },
      
      -- Mappings
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
      },
      
      -- Windows configuration
      windows = {
        ---@type "right" | "left" | "top" | "bottom"
        position = "right", -- the position of the sidebar
        wrap = true, -- similar to vim.o.wrap
        width = 30, -- default % based on available width
        sidebar_header = {
          align = "center", -- left, center, right for title
          rounded = true,
        },
      },
      
      -- Highlights configuration
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
        ---@type string | fun(): string
        list_opener = "copen",
      },
      
      -- Hints configuration (the virtual text)
      hints = { enabled = true },
      
      -- Suggestion configuration
      suggestion = {
        enabled = true,
        auto_trigger = false,
        debounce = 400, -- ms
        keymap = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
    })
  end,
}
