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
        enter_insert = false, -- Don't enter insert mode when opening (for easier scrolling)
        hide_numbers = true, -- Hide line numbers in terminal
        hide_signcolumn = true, -- Hide sign column in terminal
      },
      
      -- File refresh settings
      refresh = {
        enable = true, -- Enable file change detection
        updatetime = 100, -- updatetime when Claude Code is active (milliseconds)
        timer_interval = 1000, -- How often to check for file changes (milliseconds)
        show_notifications = false, -- Disable notifications to reduce noise
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
    })
    
    -- Set up global terminal keymaps that work reliably
    -- Exit terminal insert mode with jk (same as insert mode)
    vim.keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal insert mode" })
    
    -- Add custom terminal scrolling keymaps for all terminal buffers
    vim.api.nvim_create_autocmd({"TermOpen", "BufEnter"}, {
      pattern = "term://*",
      callback = function()
        local opts = { buffer = true, silent = true }
        
        -- Terminal mode scrolling keymaps
        vim.keymap.set("t", "<C-f>", "<C-\\><C-n><C-f>i", vim.tbl_extend("force", opts, { desc = "Scroll down (terminal)" }))
        vim.keymap.set("t", "<C-b>", "<C-\\><C-n><C-b>i", vim.tbl_extend("force", opts, { desc = "Scroll up (terminal)" }))
        vim.keymap.set("t", "<C-d>", "<C-\\><C-n><C-d>i", vim.tbl_extend("force", opts, { desc = "Half page down (terminal)" }))
        vim.keymap.set("t", "<C-u>", "<C-\\><C-n><C-u>i", vim.tbl_extend("force", opts, { desc = "Half page up (terminal)" }))
        
        -- Normal mode scrolling when in terminal buffer
        vim.keymap.set("n", "<C-f>", "<C-f>", vim.tbl_extend("force", opts, { desc = "Scroll down" }))
        vim.keymap.set("n", "<C-b>", "<C-b>", vim.tbl_extend("force", opts, { desc = "Scroll up" }))
        vim.keymap.set("n", "<C-d>", "<C-d>", vim.tbl_extend("force", opts, { desc = "Half page down" }))
        vim.keymap.set("n", "<C-u>", "<C-u>", vim.tbl_extend("force", opts, { desc = "Half page up" }))
        
        -- Exit terminal insert mode with jk (buffer-specific backup)
        vim.keymap.set("t", "jk", "<C-\\><C-n>", vim.tbl_extend("force", opts, { desc = "Exit terminal insert mode" }))
      end,
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
