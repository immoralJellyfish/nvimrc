return {
	"tpope/vim-fugitive",
	init = function()
		local opts = { silent = true, noremap = true }

		vim.keymap.set("n", "<leader>ga", ":Git<CR>", opts)
		vim.keymap.set("n", "<leader>gp", ":Git push<CR>", opts)
		vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", opts)
	end,
}
