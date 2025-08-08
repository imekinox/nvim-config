return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    -- Disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      -- Disable netrw completely
      disable_netrw = true,
      hijack_netrw = true,
      
      -- Update focused file in the tree
      update_focused_file = {
        enable = true,
        update_cwd = false,
      },
      
      -- File explorer behavior
      view = {
        width = 30,
        side = "left",
      },
      
      -- Show hidden files
      filters = {
        dotfiles = false, -- Show hidden files
        custom = { ".git", "node_modules", ".cache" }, -- But hide these
      },
      
      -- Git integration
      git = {
        enable = true,
        ignore = false,
      },
      
      -- File operations
      actions = {
        open_file = {
          quit_on_open = false, -- Keep tree open when opening files
        },
      },
      
      -- Renderer options
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
    })

    -- Key mappings
    local keymap = vim.keymap
    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
  end,
}
