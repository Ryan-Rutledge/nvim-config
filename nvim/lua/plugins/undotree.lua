return {
    'mbbill/undotree',
    keys = {
        { '<leader>u', vim.cmd.UndotreeToggle }
    },
    config = function()
        vim.g.undotree_SetFocusWhenToggle = true
        vim.g.undotree_ShortIndicators = true
    end
}
