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
        },
      },
      
      -- File refresh settings
      refresh = {
        enable = true, -- Enable file change detection
        updatetime = 100, -- updatetime when Claude Code is active (milliseconds)
        timer_interval = 1000, -- How often to check for file changes (milliseconds)
        show_notifications = true, -- Show notification when files are reloaded
      },
      
      -- Git project settings
      git = {
        use_git_root = true, -- Set CWD to git root when opening Claude Code (if in git project)
      },
      
      -- Command settings
      command = "claude", -- Command used to launch Claude Code
      
      -- Command variants
      command_variants = {
        continue = "--continue", -- Resume the most recent conversation
        resume = "--resume", -- Display an interactive conversation picker
        verbose = "--verbose", -- Enable verbose logging
      },
      
      -- Keymaps
      keymaps = {
        toggle = {
          normal = "<leader>cc", -- Normal mode keymap for toggling Claude Code
          terminal = "<C-,>", -- Terminal mode keymap for toggling Claude Code
          variants = {
            continue = "<leader>cr", -- Normal mode keymap for Claude Code with continue flag
            resume = "<leader>cp", -- Normal mode keymap for Claude Code with resume flag
            verbose = "<leader>cv", -- Normal mode keymap for Claude Code with verbose flag
          },
        },
        window_navigation = true, -- Enable window navigation keymaps (<C-h/j/k/l>)
        scrolling = true, -- Enable scrolling keymaps (<C-f/b>) for page up/down
      },
    })
  end,
  
  -- Load the plugin when these commands are used
  cmd = { "ClaudeCode", "ClaudeCodeContinue", "ClaudeCodeResume", "ClaudeCodeVerbose" },
  
  -- Or load on key mappings
  keys = {
    { "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
    { "<leader>cr", "<cmd>ClaudeCodeContinue<cr>", desc = "Continue Claude Code" },
    { "<leader>cp", "<cmd>ClaudeCodeResume<cr>", desc = "Resume Claude Code (picker)" },
    { "<leader>cv", "<cmd>ClaudeCodeVerbose<cr>", desc = "Claude Code (verbose)" },
  },
}
