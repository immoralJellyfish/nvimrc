return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    keys = {
        {"<leader>e", ":Neotree toggle<CR>", silent=true,noremap=true}
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
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
                default = ""
            },
            git_status = {
                symbols = {
                    added     = "a",
                    modified  = "m",
                    deleted   = "d",
                    renamed   = "r",
                    -- Status type
                    untracked = "u",
                    ignored   = "i",
                    unstaged  = "U",
                    staged    = "s",
                    conflict  = "c",
                }
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
            }
        },
    }
}
