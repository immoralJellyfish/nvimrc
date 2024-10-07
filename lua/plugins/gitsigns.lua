return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		on_attach = function(bufnr)
			local opts = { noremap = true, silent = true, buffer = bufnr }
			local gitsigns = require("gitsigns")

			vim.keymap.set("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", opts)
			vim.keymap.set("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", opts)

			vim.keymap.set("n", "<leader>ss", gitsigns.stage_hunk, opts)
			vim.keymap.set("n", "<leader>sr", gitsigns.reset_hunk, opts)
			vim.keymap.set("n", "<leader>sb", gitsigns.stage_buffer, opts)
			vim.keymap.set("n", "<leader>su", gitsigns.undo_stage_hunk, opts)
			vim.keymap.set("n", "<leader>sp", gitsigns.preview_hunk, opts)
			vim.keymap.set("n", "<leader>sd", gitsigns.diffthis, opts)
			vim.keymap.set("n", "<leader>sD", function()
				gitsigns.diffthis("~")
			end, opts)
			vim.keymap.set("n", "<leader>st", gitsigns.toggle_deleted, opts)
		end,
	},
}
