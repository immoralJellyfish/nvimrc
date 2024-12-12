return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	keys = function()
		local builtin = require("telescope.builtin")
		return {
			{ "<C-p>", builtin.find_files, silent = true, noremap = true },
			{ "<leader>pg", builtin.git_files, silent = true, noremap = true },
			{ "<leader>ps", builtin.live_grep, silent = true, noremap = true },
			{ "<leader>vh", builtin.help_tags, silent = true, noremap = true },
			{
				"<leader>pws",
				function()
					local word = vim.fn.expand("<cword>")
					builtin.grep_string({ search = word })
				end,
				silent = true,
				noremap = true,
			},

			{
				"<leader>pWs",
				function()
					local word = vim.fn.expand("<cWORD>")
					builtin.grep_string({ search = word })
				end,
			},
		}
	end,
}
