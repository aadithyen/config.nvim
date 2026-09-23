local mode_icons = {
	n = " ", -- NORMAL mode
	i = " ", -- INSERT mode
	v = " 󰈈", -- VISUAL mode
	[""] = " 󰈈", -- VISUAL BLOCK mode
	V = " 󰈈", -- VISUAL LINE mode
	c = " ", -- COMMAND mode
	R = " 󰈞", -- REPLACE mode
}

local function mode_icon()
	return mode_icons[vim.fn.mode()] or ""
end

local function show_macro_recording()
	local recording_register = vim.fn.reg_recording()
	if recording_register == "" then
		return ""
	else
		return "Recording @" .. recording_register
	end
end

vim.opt.laststatus = 0
vim.go.laststatus = 0

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "justinhj/battery.nvim", "loctvl842/monokai-pro.nvim" },
	config = function()
		require("lualine").setup({
			sections = {},
			tabline = {
				lualine_a = { mode_icon },
				lualine_b = {
					{
						"macro-recording",
						fmt = show_macro_recording,
					},
				},
				lualine_c = {
					{ "filename", file_status = false, path = 1 },
				},
				lualine_z = { "location" },
				lualine_y = {
					function()
						return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
					end,
					"filetype",
				},
				lualine_x = {},
			},
			options = {
				icons_enabled = true,
				theme = "monokai-pro",
				component_separators = "",
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					"oil",
				},
			},
		})

		vim.opt.laststatus = 0
		vim.go.laststatus = 0
	end,
}
