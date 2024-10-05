return {
    "mbbill/undotree",
    config = function()
        vim.g.undotree_WindowLayout = 3
        vim.g.undotree_SplitWidth = 36
        vim.g.undotree_SetFocusWhenToggle = 1
        vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
        vim.opt.undofile = true

        vim.keymap.set("n", "<leader>u",vim.cmd.UndotreeToggle, { silent = true, noremap = true })
    end,
}
