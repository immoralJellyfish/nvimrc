return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"roobert/tailwindcss-colorizer-cmp.nvim",
	},
	event = { "InsertEnter", "CmdlineEnter" },
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local tailwind_colorizer = require("tailwindcss-colorizer-cmp")
		local CMP_KINDS = {
			Text = "󰉿",
			Method = "󰆧",
			Function = "󰊕",
			Constructor = "",
			Field = "󰜢",
			Variable = "󰀫",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "󰑭",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "󰈇",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "󰙅",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "",
		}

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			formatting = {
				fields = { "abbr", "kind" },
				format = function(_, vim_item)
					vim_item.kind = (CMP_KINDS[vim_item.kind] .. "  " .. vim_item.kind) or ""
					vim_item.symbol = vim_item.kind
					return vim_item
				end,
			},
			mapping = {
				["<C-y>"] = cmp.mapping.confirm({ select = false }),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = "select" }),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-Space>"] = cmp.mapping.complete(),
				["<Up>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
				["<Down>"] = cmp.mapping.select_next_item({ behavior = "select" }),
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
			}),
		})

		tailwind_colorizer.setup({
			color_square_width = 2,
		})
	end,
}
