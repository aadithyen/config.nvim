return {
	"mcauley-penney/visual-whitespace.nvim",
	config = function()
		vim.api.nvim_set_hl(0, "VisualNonText", { fg = "#5D5F71", bg = "#24282d" })
		require("visual-whitespace").setup()
	end,
}
