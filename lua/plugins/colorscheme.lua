return {
	"catppuccin/nvim",
	priority = 9999,
	main = "catppuccin",
	name = "catppuccin",
	opts = {
		default_integrations = true,
		flavour = "mocha",
		background = {
			light = "latte",
			dark = "mocha",
		},
		transparent_background = false,
		term_colors = true,
		styles = {
			booleans = { "bold" },
			functions = { "bold" },
			comments = { "italic" },
			types = { "italic" },
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
