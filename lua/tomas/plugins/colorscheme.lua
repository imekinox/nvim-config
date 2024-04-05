return {
	{
		"NLKNguyen/papercolor-theme",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd([[colorscheme PaperColor]])
			vim.cmd([[set background=light]])
		end,
	},
}
