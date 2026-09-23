return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup()

		vim.api.nvim_create_autocmd("FileType", {
			desc = "User: enable treesitter highlighting",
			callback = function(ctx)
				-- -- highlights
				-- local hasStarted = pcall(vim.treesitter.start) -- errors for filetypes with no parser
				--
				-- -- indent
				-- local noIndent = {}
				-- if hasStarted and not vim.list_contains(noIndent, ctx.match) then
				-- 	vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				-- end
				--
				local bufnr = ctx.buf
				if not pcall(vim.treesitter.start, bufnr) then -- try to start treesitter which enables syntax highlighting
					return -- Exit if treesitter was unable to start
				end
				vim.bo[bufnr].syntax = "on" -- Use regex based syntax-highlighting as fallback as some plugins might need it
				vim.wo.foldlevel = 99
				vim.wo.foldmethod = "expr"
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for folds
				vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- Use treesitter for indentation
			end,
		})
	end,
}
--
-- return {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	branch = "master",
-- 	lazy = false,
-- 	build = ":TSUpdate",
-- 	opts = {
-- 		ensure_installed = {
-- 			"bash",
-- 			"c",
-- 			"diff",
-- 			"html",
-- 			"lua",
-- 			"luadoc",
-- 			"markdown",
-- 			"markdown_inline",
-- 			"sql",
-- 			"go",
-- 			"gomod",
-- 			"graphql",
-- 			"query",
-- 			"vim",
-- 			"vimdoc",
-- 		},
-- 		auto_install = true,
-- 		highlight = {
-- 			enable = true,
-- 			additional_vim_regex_highlighting = { "ruby" },
-- 		},
-- 		indent = { enable = true, disable = { "ruby" } },
-- 	},
-- 	config = function(_, opts)
-- 		require("nvim-treesitter.configs").setup(opts)
-- 	end,
-- }
