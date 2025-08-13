return {
	{
		"NLKNguyen/papercolor-theme",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd([[colorscheme PaperColor]])
			vim.cmd([[set background=light]])

			-- Create autocmd to override colors after colorscheme loads
			local eink_group = vim.api.nvim_create_augroup("EinkOverrides", { clear = true })

			vim.api.nvim_create_autocmd("ColorScheme", {
				group = eink_group,
				callback = function()
					-- E-ink display optimizations - pure white backgrounds
					vim.api.nvim_set_hl(0, "Normal", { bg = "#ffffff", fg = "#000000" })
					
					-- Fix tab characters and whitespace to use white background
					vim.api.nvim_set_hl(0, "Whitespace", { bg = "#ffffff", fg = "#cccccc" })
					vim.api.nvim_set_hl(0, "SpecialKey", { bg = "#ffffff", fg = "#cccccc" })
					vim.api.nvim_set_hl(0, "NonText", { bg = "#ffffff", fg = "#cccccc" })
					
					-- Fix cursor line to be very subtle
					vim.api.nvim_set_hl(0, "CursorLine", { bg = "#fafafa" })
					
					-- Fix git signs to use white background
					vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = "#ffffff", fg = "#009900" })
					vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "#ffffff", fg = "#bbbb00" })
					vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "#ffffff", fg = "#ff2222" })
					vim.api.nvim_set_hl(0, "SignColumn", { bg = "#ffffff" })
				end,
			})

			-- Apply immediately for the current session
			vim.schedule(function()
				vim.cmd("doautocmd ColorScheme")
			end)
		end,
	},
}
