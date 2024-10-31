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
				theme = "dropdown",
				hidden = true,
			},
			live_grep = {
				theme = "dropdown",
				hidden = true,
			},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>e", function()
			builtin.find_files({
				find_command = { "rg", "--files", "--hidden", "--ignore", "-u", "-g", "!.git" },
				hidden = true,
			})
		end, {
			silent = true,
			noremap = true,
		})

		vim.keymap.set("n", "<leader>pg", builtin.git_files, { silent = true, noremap = true })

		vim.keymap.set("n", "<leader>ps", builtin.live_grep, {
			silent = true,
			noremap = true,
		})

		telescope.setup(opts)
	end,
}
