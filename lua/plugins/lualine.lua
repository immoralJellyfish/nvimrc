return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "catppuccin",
			globalstatus = true,
			component_separators = "",
			section_separators = "",
			disabled_filetypes = {
				statusline = { "lazy", "undotree", "fugitive", "mason", "diff", "TelescopePrompt", "neo-tree" },
				winbar = { "lazy", "undotree", "fugitive", "mason", "diff", "TelescopePrompt", "neo-tree" },
			},
			ignore_focus = { "TelescopePrompt", "neo-tree", "toggleterm" },
			extensions = { "lazy", "nvim-tree", "toggleterm" },
		},
	},
}
