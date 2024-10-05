local exclude_automatic_setup = { "tsserver", "ts_ls" }

local function table_includes(table, value)
	for _, v in pairs(table) do
		if v == value then
			return true
		end
	end
	return false
end

local on_attach = function(_, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "gR", ":Telescope lsp_references<CR>", opts)
	vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>", opts)
	vim.keymap.set("n", "gt", ":Telescope lsp_type_definitions<CR>", opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "<leader>D", ":Telescope diagnostics bufnr=0<CR>", opts)
	vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"pmizio/typescript-tools.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local cmp_nvim_lsp_capabilities = cmp_nvim_lsp.default_capabilities()
		local typescript_tools = require("typescript-tools")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			automatic_installation = false,
			ensure_installed = {
				"ts_ls",
				"eslint",
				"phpactor",
				"gopls",
				"pylsp",
				"lua_ls",
				"rust_analyzer",
				"clangd",
				"ocamllsp",

				"dockerls",
				"bashls",
				"docker_compose_language_service",

				"sqlls",

				"emmet_ls",
				"marksman",
			},
			handlers = {
				function(server_name)
					if not table_includes(exclude_automatic_setup, server_name) then
						lspconfig[server_name].setup({
							on_attach = on_attach,
							capabilities = cmp_nvim_lsp_capabilities,
							single_file_support = true,
						})
					end
				end,
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = cmp_nvim_lsp_capabilities,
						on_attach = on_attach,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
								workspace = {
									library = {
										[vim.fn.expand("$VIMRUNTIME/lua")] = true,
										[vim.fn.stdpath("config") .. "/lua"] = true,
									},
								},
							},
						},
					})
				end,
			},
		})

		typescript_tools.setup({
			capabilities = cmp_nvim_lsp_capabilities,
			on_attach = on_attach,
			config = function()
				vim.keymap.set("n", "<leader>tsoi", ":TSToolsOrganizeImport<CR>", { noremap = true, silent = true })
				vim.keymap.set("n", "<leader>tsru", ":TSToolsRemoveUnused<CR>", { noremap = true, silent = true })
				vim.keymap.set("n", "<leader>tsmi", ":TSToolsAddMissingImports<CR>", { noremap = true, silent = true })
				vim.keymap.set("n", "<leader>tsfa", ":TSToolsFixAll<CR>", { noremap = true, silent = true })
				vim.keymap.set("n", "<leader>tsrf", ":TSToolsRenameFile<CR>", { noremap = true, silent = true })
			end,
		})
	end,
}
