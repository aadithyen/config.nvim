return {
	"stevearc/oil.nvim",
	config = function()
		vim.keymap.set("n", "\\", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		require("oil").setup({
			default_file_explorer = true,
			columns = {
				"icon",
				"size",
				"mtime",
			},
			skip_confirm_for_simple_edits = true,
			delete_to_trash = true,
			watch_for_changes = true,
			use_default_keymaps = false,
			keymaps = {
				["g?"] = { "actions.show_help", mode = "n" },
				["<CR>"] = "actions.select",
				["<C-s>"] = { "actions.select", opts = { vertical = true } },
				["<C-p>"] = "actions.preview",
				["<C-c>"] = { "actions.close", mode = "n" },
				["-"] = { "actions.parent", mode = "n" },
				["_"] = { "actions.open_cwd", mode = "n" },
				["`"] = { "actions.cd", mode = "n" },
				["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
				["gs"] = { "actions.change_sort", mode = "n" },
				["gx"] = "actions.open_external",
				["g."] = { "actions.toggle_hidden", mode = "n" },
				["g\\"] = { "actions.toggle_trash", mode = "n" },
			},
			view_options = {
				show_hidden = true,
				natural_order = true,
				is_always_hidden = function(name, _)
					if name == ".DS_Store" then
						return true
					end
					return false
				end,
			},
		})
	end,
}
