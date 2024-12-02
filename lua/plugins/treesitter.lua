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
		indent = { enable = true },
		highlight = {
			enable = true,
		},
		ensure_installed = {
			"c",
			"rust",
			"go",
			"php",
			"javascript",
			"typescript",
			"lua",

			"blade",
			"html",
			"css",
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
	config = function(_, opts)
		local treesitter = require("nvim-treesitter.configs")
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		local tsautotag = require("nvim-ts-autotag")

		vim.filetype.add({
			pattern = {
				[".*%.blade%.php"] = "blade",
				[".*/hypr/.*%.conf"] = "hyprlang",
			},
		})

		parser_config.blade = {
			install_info = {
				url = "https://github.com/EmranMR/tree-sitter-blade",
				files = { "src/parser.c" },
				branch = "main",
			},
			filetype = "blade",
		}

		treesitter.setup(opts)
		tsautotag.setup({
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
		})
	end,
}
