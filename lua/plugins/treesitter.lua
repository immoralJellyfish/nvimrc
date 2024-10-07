return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
	},
	main = "nvim-treesitter.configs",
	opts = {
		auto_install = true,
		highlight = {
			enable = true,
		},
		indent = { enable = true },
		autotag = {
			enable = true,
		},
		ensure_installed = {
			"javascript",
			"typescript",
			"rust",
			"lua",
			"vim",
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				node_decremental = "<bs>",
				scope_incremental = false,
			},
		},
	},
}
