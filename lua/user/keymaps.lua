-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-m>", ":m +1<CR>", opts)
keymap("n", "<C-M>", ":m -2<CR>", opts)

-- NvimTree
keymap("n", "<C-t>", ":NvimTreeToggle<CR>", opts)

-- Git
keymap("n", "<C-b>", ":Gitsigns blame_line<CR>", opts)
