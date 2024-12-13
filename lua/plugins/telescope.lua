return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	keys = function()
		local builtin = require("telescope.builtin")
		return {
			{
				"<C-p>",
				function()
					builtin.find_files({ hidden = true })
				end,
				silent = true,
				noremap = true,
			},
			{
				"<leader>pws",
				function()
					local word = vim.fn.expand("<cword>")
					builtin.grep_string({ search = word, hidden = true })
				end,
				silent = true,
				noremap = true,
			},
			{
				"<leader>pWs",
				function()
					local word = vim.fn.expand("<cWORD>")
					builtin.grep_string({ search = word, hidden = true })
				end,
			},
			{
				"<leader>pg",
				function()
					builtin.git_files({ hidden = true })
				end,
				silent = true,
				noremap = true,
			},
			{ "<leader>ps", builtin.live_grep, silent = true, noremap = true },
			{ "<leader>vh", builtin.help_tags, silent = true, noremap = true },
		}
	end,
}
