vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = 'help',
    callback = function(_)
        vim.opt.number = true
    end
})
