return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  config = function()
    require("claude-code").setup({
      -- Terminal window settings
      window = {
        split_ratio = 0.4, -- 40% of screen for the terminal window
        position = "botright", -- Bottom right position
        enter_insert = true, -- Enter insert mode when opening
        hide_numbers = true, -- Hide line numbers in terminal
        hide_signcolumn = true, -- Hide sign column in terminal
        
        -- Floating window configuration (alternative)
        float = {
          width = "85%", -- Width of floating window
          height = "80%", -- Height of floating window  
          row = "center", -- Center vertically
          col = "center", -- Center horizontally
          relative = "editor", -- Relative to editor
          border = "rounded", -- Border style
          title = " Claude Code ", -- Window title
          title_pos = "center", -- Title position
        },
      },
      
      -- Claude Code CLI settings
      claude = {
        command = "claude", -- Claude CLI command (installed via npm)
        args = {}, -- Default arguments to pass
        auto_reload = true, -- Auto-reload files changed by Claude
        working_directory = "auto", -- Use git root or current directory
      },
      
      -- Key mappings
      mappings = {
        toggle = "<leader>cc", -- Toggle Claude Code terminal
        new_session = "<leader>cn", -- Start new Claude Code session
        continue = "<leader>cr", -- Continue previous session
        close = "<leader>cq", -- Close Claude Code terminal
      },
      
      -- Integration settings
      integrations = {
        which_key = true, -- Register with which-key if available
        auto_detect_changes = true, -- Detect file changes from Claude
        reload_buffers = true, -- Auto-reload changed buffers
      },
    })
  end,
  
  -- Load the plugin when these commands are used
  cmd = { "ClaudeCode", "ClaudeCodeToggle", "ClaudeCodeNew", "ClaudeCodeContinue" },
  
  -- Or load on key mappings
  keys = {
    { "<leader>cc", "<cmd>ClaudeCodeToggle<cr>", desc = "Toggle Claude Code" },
    { "<leader>cn", "<cmd>ClaudeCodeNew<cr>", desc = "New Claude Code session" },
    { "<leader>cr", "<cmd>ClaudeCodeContinue<cr>", desc = "Continue Claude Code" },
    { "<leader>cq", "<cmd>ClaudeCodeClose<cr>", desc = "Close Claude Code" },
  },
}
