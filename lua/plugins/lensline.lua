return {
	"oribarilan/lensline.nvim",
	tag = "2.0.0",
	event = "LspAttach",
	config = function()
		require("lensline").setup({
			profiles = {
				{
					name = "basic",
					providers = {
						{ name = "usages", enabled = true, include = { "refs" }, breakdown = false },
						-- { name = "last_author", enabled = true },
					},
					style = { render = "all", placement = "inline", prefix = "" },
				},
				{
					name = "informative",
					providers = {
						{ name = "usages", enabled = true, include = { "refs", "defs", "impls" }, breakdown = true },
						{ name = "diagnostics", enabled = true, min_level = "HINT" },
						{ name = "complexity", enabled = true },
						{ name = "last_author", enabled = true },
					},
					style = { render = "all", placement = "above" },
				},
			},
		})
	end,
}
