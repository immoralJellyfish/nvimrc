return {
	"nvim-telescope/telescope.nvim",
	branch = false,
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	opts = {
		defaults = {
			file_ignore_patterns = { "%.git/*" },
			selection_caret = "  ",
			path_display = { "smart" },
			mappings = {
				i = {
					["<C-t>"] = "nop",
				},

				n = {
					["<C-t>"] = "nop",
				},
			},
		},
		pickers = {
			find_files = {
				hidden = true,
			},
			git_files = {
				hidden = true,
			},
			live_grep = {
				hidden = true,
			},
		},
	},
	init = function()
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>e", builtin.find_files, { silent = true, noremap = true })
		vim.keymap.set("n", "<leader>pg", builtin.git_files, { silent = true, noremap = true })
		vim.keymap.set("n", "<leader>ps", builtin.live_grep, { silent = true, noremap = true })
		vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>pws", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set("n", "<leader>pWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
	end,
}
