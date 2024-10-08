return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	keys = {
		{ "<leader>e", ":Neotree toggle<CR>", silent = true, noremap = true },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		default_component_configs = {
			indent = {
				with_expanders = true,
				expander_collapsed = "",
				expander_expanded = "",
			},
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "",
				default = "",
			},
			git_status = {
				symbols = {
					added = "a",
					modified = "m",
					deleted = "d",
					renamed = "r",
					-- Status type
					untracked = "u",
					ignored = "i",
					unstaged = "U",
					staged = "s",
					conflict = "c",
				},
			},
		},
		window = {
			width = 35,
			mappings = {
				["t"] = {
					"toggle_node",
					nowait = false,
				},
				["<tab>"] = "open",
			},
		},
		follow_current_file = {
			enabled = true,
			leave_dirs_open = false,
		},
		filesystem = {
			commands = {
				delete = function(state)
					local inputs = require("neo-tree.ui.inputs")
					local path = state.tree:get_node().path
					local msg = "Are you sure you want to trash " .. path

					inputs.confirm(msg, function(confirmed)
						if not confirmed then
							return
						end

						vim.fn.system({ "trash", vim.fn.fnameescape(path) })
						require("neo-tree.sources.manager").refresh(state.name)
					end)
				end,

				delete_visual = function(state, selected_nodes)
					local inputs = require("neo-tree.ui.inputs")
					local msg = "Are you sure you want to trash " .. #selected_nodes .. " files ?"

					inputs.confirm(msg, function(confirmed)
						if not confirmed then
							return
						end

						for _, node in ipairs(selected_nodes) do
							vim.fn.system({ "trash", vim.fn.fnameescape(node.path) })
						end
						require("neo-tree.sources.manager").refresh(state.name)
					end)
				end,
			},
		},
	},
}
