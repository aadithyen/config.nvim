return {
	"loctvl842/monokai-pro.nvim",
	priority = 1000,
	config = {
		devicons = true,
		day_night = {
			enable = true, -- turn off by default
			day_filter = "light", -- classic | octagon | pro | machine | ristretto | spectrum
			night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
		},
	},
	init = function()
		vim.cmd.colorscheme("monokai-pro")
	end,
}
