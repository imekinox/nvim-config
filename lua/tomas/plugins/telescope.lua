return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        file_ignore_patterns = {
          "node_modules/.*",
          ".git/.*",
          ".next/.*",
          ".claude/.*",
          "%.lock",
          "dist/.*",
          "build/.*",
          "%.min.js",
          "%.min.css",
          "coverage/.*",
          "%.cache/.*",
        },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true, -- show hidden files
          -- Use ripgrep to find files, excluding specific directories but including hidden files
          find_command = { 
            "rg", 
            "--files", 
            "--hidden", 
            "--glob", "!**/.git/*", 
            "--glob", "!**/node_modules/*",
            "--glob", "!**/.next/*",
            "--glob", "!**/.claude/*",
            "--glob", "!**/dist/*",
            "--glob", "!**/build/*",
            "--glob", "!**/.cache/*",
          },
        },
        live_grep = {
          additional_args = function()
            return { 
              "--hidden", 
              "--glob", "!**/.git/*", 
              "--glob", "!**/node_modules/*",
              "--glob", "!**/.next/*",
              "--glob", "!**/.claude/*",
              "--glob", "!**/dist/*",
              "--glob", "!**/build/*",
            }
          end
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
  end,
}
