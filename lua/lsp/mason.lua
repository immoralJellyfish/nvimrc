return {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"nvimtools/none-ls.nvim",
		"jay-babu/mason-null-ls.nvim",
		"pmizio/typescript-tools.nvim",
	},

	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_null_ls = require("mason-null-ls")

		mason.setup({
			max_concurrent_installers = #vim.loop.cpu_info() / 2,
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			automatic_installation = true,
			ensure_installed = {
				"html",
				"cssls",
				"emmet_ls",

				"ts_ls",
				"eslint",
				"intelephense",
				"clangd",
				"rust_analyzer",
				"gopls",
				"phpactor",
				"lua_ls",
			},
		})

		mason_null_ls.setup({
			automatic_installation = true,
			ensure_installed = {
				"prettier",
				"stylua",
				"beautysh",
				"php_cs_fixer",
				"clang-format",
				"shellcheck",
			},
		})
	end,
}
